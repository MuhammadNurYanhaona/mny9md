/* File: ast_stmt.cc
 * -----------------
 * Implementation of statement node classes.
 */
#include "ast_stmt.h"
#include "ast_type.h"
#include "ast_decl.h"
#include "ast_expr.h"
#include "scope.h"
#include "hashtable.h"
#include "stack"
#include "ast.h"
#include "errors.h"
#include "codegen.h"
#include "utility.h"


Program::Program(List<Decl*> *d) {
    Assert(d != NULL);
    (decls=d)->SetParentAll(this);
}

void Program::Check() {
    /* pp3: here is where the semantic analyzer is kicked off.
     *      The general idea is perform a tree traversal of the
     *      entire program, examining all constructs for compliance
     *      with the semantic rules.  Each node can have its own way of
     *      checking itself, which makes for a great use of inheritance
     *      and polymorphism in the node classes.
     */

    // construct symbol tables for all classes, interfaces, and functions	
    Scope *globalScope = new Scope(GlobalScope);
    ConstructSymbolTable(globalScope);
    linkClassScopesByInheritence(globalScope);	
    
    // then start semantic validation using an in-order traversal	
    checkSemantics(globalScope);   	
}

Scope* Program::ConstructSymbolTable(Scope *currentScope) { 

    // insert the default classes in the scope	
    currentScope->insert_symbol(new ClassSymbol(Type::intType));	
    currentScope->insert_symbol(new ClassSymbol(Type::doubleType));	
    currentScope->insert_symbol(new ClassSymbol(Type::boolType));	
    currentScope->insert_symbol(new ClassSymbol(Type::stringType));	
    currentScope->insert_symbol(new ClassSymbol(Type::voidType));
    currentScope->insert_symbol(new ClassSymbol(Type::nullType));
    // insert a place holder error symbol to be used in all error cases		
    currentScope->insert_symbol(new ErrorSymbol(Type::errorType->getName()));	

    // insert the global declarations in the scope		
    for (int i = 0; i < decls->NumElements(); i++) {
	Decl *decl = decls->Nth(i);
	if (decl->getSymbolType() != NotApplicable) {
		char *symbolName = decl->getName();
		if (currentScope->lookup(symbolName) != NULL) continue;
		Symbol *symbol = currentScope->insert_symbol(decl);
		Scope *nestedScope = decl->ConstructSymbolTable(currentScope);
		if (nestedScope != currentScope) {
			symbol->setNestedScope(nestedScope);
		}
	}
    } 	
    return currentScope;
}

void Program::linkClassScopesByInheritence(Scope *currentScope) {
	Iterator<Symbol*> symbols = currentScope->getAllLocalSymbols();
	Symbol *symbol;
	while ((symbol = symbols.GetNextValue()) != NULL) {
		if (symbol->getType() == Class && symbol->getDecl() != NULL) {
			ClassDecl *decl = (ClassDecl*) symbol->getDecl();
			NamedType *base = decl->getExtends();
			if (base != NULL) {
				Symbol *baseSymbol = currentScope->lookup(base->getName());
				if (baseSymbol != NULL) {
					symbol->getNestedScope()->setBase(baseSymbol->getNestedScope());
				}
			}
		}
	}
}

void Program::checkSemantics(Scope *currentScope) {
	for (int i = 0; i < decls->NumElements(); i++) {
		Decl *decl = decls->Nth(i);
		decl->checkSemantics(currentScope);
	}
}

void Program::Emit() {
    /* pp5: here is where the code generation is kicked off.
     *      The general idea is perform a tree traversal of the
     *      entire program, generating instructions as you go.
     *      Each node can have its own way of translating itself,
     *      which makes for a great use of inheritance and
     *      polymorphism in the node classes.
     */

	// search for main function first
	bool mainFunctionFound = false;
	for (int i = 0; i < decls->NumElements(); i++) {
		Decl *decl = decls->Nth(i);
		FnDecl *fnDecl = dynamic_cast<FnDecl*> (decl);
		if (fnDecl != NULL && (strcmp("main", fnDecl->getName()) == 0)) {
			mainFunctionFound = true;
			break;
		}
	}
	if (!mainFunctionFound) {
		ReportError::NoMainFound();
		return;
	}
	

	//SetDebugForKey("tac", true);
	CodeGenerator *codegen = new CodeGenerator();

	// allocate locations for the global variables
	for (int i = 0; i < decls->NumElements(); i++) {
		Decl *decl = decls->Nth(i);
		VarDecl *varDecl = dynamic_cast<VarDecl*> (decl);
		if (varDecl != NULL) {
			globalStack->createLocalVar(varDecl->getName());
		}
	}

	// create vtables and methods for classes
	List<ClassDecl*> *classList = new List<ClassDecl*>;
	for (int i = 0; i < decls->NumElements(); i++) {
		Decl *decl = decls->Nth(i);
		ClassDecl *classDecl = dynamic_cast<ClassDecl*> (decl);
		if (classDecl != NULL) {
			classList->Append(classDecl);
			ClassDecl::classDeclList->Enter(classDecl->getName(), classDecl, false);
		}
	}
	for (int i = 0; i < classList->NumElements(); i++) {
		ClassDecl *classDecl = classList->Nth(i);
		classDecl->createObjectRepresentation(classList);
	}
	for (int i = 0; i < classList->NumElements(); i++) {
		ClassDecl *classDecl = classList->Nth(i);
		classDecl->Emit(codegen);
	}

	// generate codes for global methods
	for (int i = 0; i < decls->NumElements(); i++) {
		Decl *decl = decls->Nth(i);
		FnDecl *fnDecl = dynamic_cast<FnDecl*> (decl);
		if (fnDecl != NULL) {
			fnDecl->Emit(codegen);
		}
	}

	codegen->DoFinalCodeGen();   	
}

StmtBlock::StmtBlock(List<VarDecl*> *d, List<Stmt*> *s) {
    Assert(d != NULL && s != NULL);
    (decls=d)->SetParentAll(this);
    (stmts=s)->SetParentAll(this);
}

void StmtBlock::checkSemantics(Scope *currentScope) {
	Scope *blockScope = new Scope(StatementBlockScope);
	currentScope = currentScope->enter_scope(blockScope);	
	for (int i = 0; i < decls->NumElements(); i++) {
		Decl *decl = decls->Nth(i);
		if (blockScope->local_lookup(decl->getName()) == NULL) {	
			blockScope->insert_symbol(decl);
		}
		decl->checkSemantics(currentScope);
	}
	for (int i = 0; i < stmts->NumElements(); i++) {
		Stmt *stmt = stmts->Nth(i);
		stmt->checkSemantics(currentScope);
	}
}

void StmtBlock::Emit(CodeGenerator *codegen) {

	List<Location*> *localVariables = new List<Location*>;

	// allocate the variables in the current stack frame
	for (int i = 0; i < decls->NumElements(); i++) {
		Decl *decl = decls->Nth(i);
		Location *loc = currentLocalStack->createLocalVar(decl->getName());
		localVariables->Append(loc);
	}

	// generate code for statements
	for (int i = 0; i < stmts->NumElements(); i++) {
		Stmt *stmt = stmts->Nth(i);
		stmt->Emit(codegen);
	}

	// remove the local variables from the activation stack to avoid name conflicts
	for (int i = 0; i < localVariables->NumElements(); i++) {
		Location *loc = localVariables->Nth(i);
		currentLocalStack->removeLocalVariable(loc->GetName(), loc);
	}
}

ConditionalStmt::ConditionalStmt(Expr *t, Stmt *b) { 
    Assert(t != NULL && b != NULL);
    (test=t)->SetParent(this); 
    (body=b)->SetParent(this);
}

ForStmt::ForStmt(Expr *i, Expr *t, Expr *s, Stmt *b): LoopStmt(t, b) { 
    Assert(i != NULL && t != NULL && s != NULL && b != NULL);
    (init=i)->SetParent(this);
    (step=s)->SetParent(this);
}

void ForStmt::checkSemantics(Scope *currentScope) {
	init->checkSemantics(currentScope);
	test->checkSemantics(currentScope);
	if (!Type::boolType->isCompatibleType(currentScope, test->getExprType())) {
		ReportError::TestNotBoolean(test);
	}
	step->checkSemantics(currentScope);
	body->checkSemantics(currentScope);
}

void ForStmt::Emit(CodeGenerator *codegen) {
	init->generateCode(codegen);
	int forBeginNo = globalStack->getNextLabelNum();
	int forEndNo = globalStack->getNextLabelNum();
	char begin[20], end[20];
	sprintf(begin, "loopBegin_%d", forBeginNo);
	sprintf(end, "loopEnd_%d", forEndNo);
	codegen->GenLabel(begin);
	globalStack->setLoopMarker(forEndNo);
	Location *t = test->generateCode(codegen);
	codegen->GenIfZ(t, end);
	body->Emit(codegen);
	step->generateCode(codegen);
	codegen->GenGoto(begin);
	codegen->GenLabel(end);
}

void WhileStmt::checkSemantics(Scope *currentScope) {
	test->checkSemantics(currentScope);
	if (!Type::boolType->isCompatibleType(currentScope, test->getExprType())) {
		ReportError::TestNotBoolean(test);
	}
	body->checkSemantics(currentScope);
}

void WhileStmt::Emit(CodeGenerator *codegen) {
	int whileBeginNo = globalStack->getNextLabelNum();
	int whileEndNo = globalStack->getNextLabelNum();
	char begin[20], end[20];
	sprintf(begin, "loopBegin_%d", whileBeginNo);
	sprintf(end, "loopEnd_%d", whileEndNo);
	codegen->GenLabel(begin);
	Location *t = test->generateCode(codegen);
	codegen->GenIfZ(t, end);
	globalStack->setLoopMarker(whileEndNo);
	body->Emit(codegen);
	codegen->GenGoto(begin);
	codegen->GenLabel(end);
}

IfStmt::IfStmt(Expr *t, Stmt *tb, Stmt *eb): ConditionalStmt(t, tb) { 
    Assert(t != NULL && tb != NULL); // else can be NULL
    elseBody = eb;
    if (elseBody) elseBody->SetParent(this);
}

void IfStmt::checkSemantics(Scope *currentScope) {
	test->checkSemantics(currentScope);
	if (!Type::boolType->isCompatibleType(currentScope, test->getExprType())) {
		ReportError::TestNotBoolean(test);
	}
	body->checkSemantics(currentScope);
	if (elseBody != NULL) {
		elseBody->checkSemantics(currentScope);
	}
}

void IfStmt::Emit(CodeGenerator *codegen) {
	Location *t = test->generateCode(codegen);
	int elseLabelNo = globalStack->getNextLabelNum();
	char elseLabel[20], end[20];
	sprintf(elseLabel, "else_%d", elseLabelNo);
	int endLabelNo = globalStack->getNextLabelNum();
	sprintf(end, "endif_%d", endLabelNo);
	codegen->GenIfZ(t, elseLabel);
	body->Emit(codegen);
	codegen->GenGoto(end);
	codegen->GenLabel(elseLabel);
	if (elseBody != NULL) {
		elseBody->Emit(codegen);
	}
	codegen->GenLabel(end);
}

void BreakStmt::checkSemantics(Scope *currentScope) {
	bool insideLoop = false;
	Node *p = this->GetParent();
	while (p != NULL) {
		if (p->isLoop()) {
			insideLoop = true;
			break;
		}
		p = p->GetParent();
	}
	if (!insideLoop) {
 		ReportError::BreakOutsideLoop(this);
	}
}

void BreakStmt::Emit(CodeGenerator *codegen) {
	int jumpLocation = globalStack->getCurrentLoopMarker();
	char jumpLabel[20];
	sprintf(jumpLabel, "loopEnd_%d", jumpLocation);
	codegen->GenGoto(jumpLabel);
}

ReturnStmt::ReturnStmt(yyltype loc, Expr *e) : Stmt(loc) { 
    Assert(e != NULL);
    (expr=e)->SetParent(this);
}

void ReturnStmt::Emit(CodeGenerator *codegen) {
	if (expr == NULL) codegen->GenReturn();
	else {
		Location *location = expr->generateCode(codegen);
		codegen->GenReturn(location);
	}	
}

void ReturnStmt::checkSemantics(Scope *currentScope) {
	
	expr->checkSemantics(currentScope);
	Type *returnType = expr->getExprType();

	Scope *functionScope = currentScope->getClosestScopeByType(FunctionScope);
	if (functionScope != NULL) {
		Symbol *symbol = functionScope->lookup(functionScope->getName());
		if (symbol != NULL && symbol->getType() == Function) {
			FunctionSymbol *fnSymbol = (FunctionSymbol *) symbol;
			if (!fnSymbol->getAstType()->isCompatibleType(currentScope, returnType)) {
				ReportError::ReturnMismatch(this, returnType, fnSymbol->getAstType());
			}
		}
	}	
}
  
PrintStmt::PrintStmt(List<Expr*> *a) {    
    Assert(a != NULL);
    (args=a)->SetParentAll(this);
}

void PrintStmt::checkSemantics(Scope *currentScope) {
	for (int i = 0; i < args->NumElements(); i++) {
		Expr* arg = args->Nth(i);
		arg->checkSemantics(currentScope);
		Type *argType = arg->getExprType();
		if (!(Type::stringType->isCompatibleType(currentScope, argType) 
				|| Type::boolType->isCompatibleType(currentScope, argType) 
				|| Type::intType->isCompatibleType(currentScope, argType))) {
			ReportError::PrintArgMismatch(arg, i + 1, argType);
		}
	}
}

void PrintStmt::Emit(CodeGenerator *codegen) {
	for (int i = 0; i < args->NumElements(); i++) {
		Expr *arg = args->Nth(i);
		Location* location = arg->generateCode(codegen);
		if (Type::stringType == arg->getExprType()) {
			codegen->GenBuiltInCall(PrintString, location);
		} else if (Type::boolType == arg->getExprType()) {
			codegen->GenBuiltInCall(PrintBool, location);
		} else {
			codegen->GenBuiltInCall(PrintInt, location);
		}
	}
}

CaseStmt::CaseStmt(Stmt *v, List<Stmt*> *s) {
   Assert(v != NULL && s != NULL);
   (value = v)->SetParent(this);
   (stmts = s)->SetParentAll(this);
   name = "Case";
}

CaseStmt::CaseStmt(List<Stmt*> *s) {
   Assert(s != NULL);
   (stmts = s)->SetParentAll(this);
   name = "Default";
}

void CaseStmt::checkSemantics(Scope *currentScope) {
   for (int i = 0; i < stmts->NumElements(); i++) {
       Stmt* stmt = stmts->Nth(i);
       stmt->checkSemantics(currentScope); 
   }
}

SwitchStmt::SwitchStmt(Expr *co, List<CaseStmt*> *ca) {
    Assert(co != NULL && ca != NULL);
    (condition = co)->SetParent(this);
    (cases = ca)->SetParentAll(this);
}

void SwitchStmt::checkSemantics(Scope *currentScope) {
    for (int i = 0; i < cases->NumElements(); i++) {
        CaseStmt *ca = cases->Nth(i);
        ca->checkSemantics(currentScope);
    }
}
