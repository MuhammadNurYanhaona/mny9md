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
    
    // then start semantic validation using an in-order traversal	
    checkSemantics(globalScope);   	
}

Scope* Program::ConstructSymbolTable(Scope *currentScope) { 

    // insert the default classes in the scope	
    currentScope->insert_symbol(new ClassSymbol(Type::intType->getName(), Class));	
    currentScope->insert_symbol(new ClassSymbol(Type::doubleType->getName(), Class));	
    currentScope->insert_symbol(new ClassSymbol(Type::boolType->getName(), Class));	
    currentScope->insert_symbol(new ClassSymbol(Type::stringType->getName(), Class));	

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

void Program::checkSemantics(Scope *currentScope) {
	for (int i = 0; i < decls->NumElements(); i++) {
		Decl *decl = decls->Nth(i);
		decl->checkSemantics(currentScope);
	}
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
	body->checkSemantics(currentScope);
}

void WhileStmt::checkSemantics(Scope *currentScope) {
	body->checkSemantics(currentScope);
}

IfStmt::IfStmt(Expr *t, Stmt *tb, Stmt *eb): ConditionalStmt(t, tb) { 
    Assert(t != NULL && tb != NULL); // else can be NULL
    elseBody = eb;
    if (elseBody) elseBody->SetParent(this);
}

void IfStmt::checkSemantics(Scope *currentScope) {
	body->checkSemantics(currentScope);
	if (elseBody != NULL) {
		elseBody->checkSemantics(currentScope);
	}
}

ReturnStmt::ReturnStmt(yyltype loc, Expr *e) : Stmt(loc) { 
    Assert(e != NULL);
    (expr=e)->SetParent(this);
}
  
PrintStmt::PrintStmt(List<Expr*> *a) {    
    Assert(a != NULL);
    (args=a)->SetParentAll(this);
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
