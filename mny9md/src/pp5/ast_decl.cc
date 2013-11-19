/* File: ast_decl.cc
 * -----------------
 * Implementation of Decl node classes.
 */
#include "ast_decl.h"
#include "ast_type.h"
#include "ast_stmt.h"
#include "errors.h"
#include "codegen.h"
#include "tac.h"
#include "ast.h"
        
         
Decl::Decl(Identifier *n) : Node(*n->GetLocation()) {
    Assert(n != NULL);
    (id=n)->SetParent(this); 
}

VarDecl::VarDecl(Identifier *n, Type *t) : Decl(n) {
    Assert(n != NULL && t != NULL);
    (type=t)->SetParent(this);
}

void VarDecl::checkSemantics(Scope *currentScope) {

	Scope *globalScope = currentScope->getClosestScopeByType(GlobalScope);

	// check if it is a duplicate declaration
	Symbol *symbol = currentScope->local_lookup(this->getName());
	if (symbol->getDecl() != this) {
		ReportError::DeclConflict(this, symbol->getDecl());
	}
	
	// get penaltimate element type of the variable
	Type *coreType = type;
	while (coreType->getVariableType() == Array) 
		coreType = ((ArrayType *) coreType)->getElementType();
 	
	// check for existence of the type
	const char* coreTypeName = coreType->getName();
	if (coreType->getVariableType() == Object 
			&& (globalScope->lookup(coreTypeName) == NULL 
				|| (globalScope->lookup(coreTypeName)->getType() != Class
					&& globalScope->lookup(coreTypeName)->getType() != Interface))) {
		ReportError::IdentifierNotDeclared(
			((NamedType *) coreType)->getIdentifier(), LookingForType);

		// Enter an error symbol for this declaration to avoid more type checking error messages
		currentScope->insert_symbol(new ErrorSymbol(this));
	}
}

ClassDecl::ClassDecl(Identifier *n, NamedType *ex, List<NamedType*> *imp, List<Decl*> *m) : Decl(n) {
    // extends can be NULL, impl & mem may be empty lists but cannot be NULL
    Assert(n != NULL && imp != NULL && m != NULL);     
    extends = ex;
    if (extends) extends->SetParent(this);
    (implements=imp)->SetParentAll(this);
    (members=m)->SetParentAll(this);
}

Scope* ClassDecl::ConstructSymbolTable(Scope *currentScope) {
	Scope *classScope = new Scope(ClassScope);
	classScope->setName(this->getName());
	for (int i = 0; i < members->NumElements(); i++) {
        	Decl *decl = members->Nth(i);
		char *symbolName = decl->getName();
		if (classScope->lookup(symbolName) != NULL) continue;
		Symbol *symbol = classScope->insert_symbol(decl);
		Scope *nestedScope = decl->ConstructSymbolTable(classScope);
		if (nestedScope != classScope) {
			symbol->setNestedScope(nestedScope);
		}
	}
	return classScope;
}

void ClassDecl::checkSemantics(Scope *currentScope) {
	
	Symbol *symbol = currentScope->lookup(this->getName());
	Scope *classScope;
	
	// validate the declaration of the class itself
	if (symbol->getDecl() != this) {
		ReportError::DeclConflict(this, symbol->getDecl());
		classScope = this->ConstructSymbolTable(currentScope);
	} else {
		classScope = symbol->getNestedScope();
	}
	
	// check the validity of the superclass, if present
	if (this->extends != NULL) {
		Symbol* base = currentScope->lookup(this->extends->getName());
		if (base != NULL && base->getType() == Class) {
			currentScope = currentScope->enter_scope(base->getNestedScope());
		} else {
			ReportError::IdentifierNotDeclared(this->extends->getIdentifier(), LookingForClass);
		}
	}
	
	// check if all implemented interfaces are indeed present and full interface has been implemented
	for (int i = 0; i < implements->NumElements(); i++) {
		NamedType* iName = implements->Nth(i);
		Symbol* interface = currentScope->lookup(iName->getName());
		if (interface != NULL && interface->getType() == Interface) {
			Scope* interfaceScope = interface->getNestedScope();
			Iterator<Symbol*> inheritedMethods = interfaceScope->getAllLocalSymbols();
			Symbol* inheritedMethod;
			bool matchFound = true;
			while ((inheritedMethod = inheritedMethods.GetNextValue()) != NULL) {
				bool currentMatchFound = false;
				for (int i = 0; i < members->NumElements(); i++) {
					Decl *decl = members->Nth(i);
					if (decl->getSymbolType() != Function) continue;
					FnDecl *fnDecl = (FnDecl*) decl;
					if (strcmp(fnDecl->getName(), inheritedMethod->getName()) == 0) {
						currentMatchFound = true;
						break;
					} 
				}
				if (!currentMatchFound) {
					matchFound = false;
					classScope->insert_symbol(inheritedMethod);
				}
			}
			if (!matchFound) {
				ReportError::InterfaceNotImplemented(this, iName);
			}	
			currentScope = currentScope->enter_scope(interfaceScope);
		} else {
			ReportError::IdentifierNotDeclared(iName->getIdentifier(), LookingForInterface);
		}
	}
	
	// validate all member declarations
	for (int i = 0; i < members->NumElements(); i++) {
		
		Decl *decl = members->Nth(i);
		Symbol *symbol = classScope->lookup(decl->getName());
		Symbol *inheritedSymbol = currentScope->lookup(decl->getName());

		if (inheritedSymbol != NULL && inheritedSymbol->getScopeType() != GlobalScope) {
			if (!symbol->isEquivalentType(inheritedSymbol) || symbol->getType() == Variable) {
				ReportError::DeclConflict(decl, inheritedSymbol->getDecl());
			} else {
				FunctionSymbol *localFunction = (FunctionSymbol *) symbol;
				FunctionSymbol *baseFunction = (FunctionSymbol *) inheritedSymbol;
				if (!localFunction->matchSignature(baseFunction)) {
					ReportError::OverrideMismatch(decl);
				}	
			}	
		}

		// go inside the member and validate it	
		currentScope = currentScope->enter_scope(classScope);
		decl->checkSemantics(currentScope);
		currentScope = currentScope->exit_scope();
	}
}

InterfaceDecl::InterfaceDecl(Identifier *n, List<Decl*> *m) : Decl(n) {
    Assert(n != NULL && m != NULL);
    (members=m)->SetParentAll(this);
}

Scope* InterfaceDecl::ConstructSymbolTable(Scope *currentScope) {
	Scope *interfaceScope = new Scope(InterfaceScope);
	interfaceScope->setName(this->getName());
	for (int i = 0; i < members->NumElements(); i++) {
        	Decl *decl = members->Nth(i);
		char *symbolName = decl->getName();
		if (interfaceScope->lookup(symbolName) != NULL) continue;
		Symbol *symbol = interfaceScope->insert_symbol(decl);
		Scope *nestedScope = decl->ConstructSymbolTable(interfaceScope);
		if (nestedScope != interfaceScope) {
			symbol->setNestedScope(nestedScope);
		}
	}
	return interfaceScope;
}

void InterfaceDecl::checkSemantics(Scope *currentScope) {
	Symbol *symbol = currentScope->lookup(this->getName());
	Scope *interfaceScope = symbol->getNestedScope();
	if (symbol->getDecl() != this) {
		ReportError::DeclConflict(this, symbol->getDecl());
		interfaceScope = this->ConstructSymbolTable(currentScope);
	}
	currentScope = currentScope->enter_scope(interfaceScope);
	for (int i = 0; i < members->NumElements(); i++) {
		Decl *decl = members->Nth(i);
		decl->checkSemantics(currentScope);	
	}	
}
	
FnDecl::FnDecl(Identifier *n, Type *r, List<VarDecl*> *d) : Decl(n) {
    Assert(n != NULL && r!= NULL && d != NULL);
    (returnType=r)->SetParent(this);
    (formals=d)->SetParentAll(this);
    body = NULL;
    runtimeStack = NULL;
    tacName = NULL;		
}

const char* FnDecl::getTacName() {
	if (this->tacName != NULL) return this->tacName;
	const char *n = this->getName(); 
	if (strcmp("main", n) == 0) return n;
	ClassDecl *owner = dynamic_cast<ClassDecl*>(parent);
	char temp[30];
	if (owner != NULL) {
		sprintf(temp, "%s_%s", owner->getName(), n);
	} else {
		sprintf(temp, "_%s", n);
	}
	this->tacName = strdup(temp);
	return this->tacName;
}

Scope* FnDecl::ConstructSymbolTable(Scope *currentScope) {
	Scope *functionScope = new Scope(FunctionScope);
	functionScope->setName(this->getName());
	for (int i = 0; i < formals->NumElements(); i++) {
        	Decl *decl = formals->Nth(i);
		char *symbolName = decl->getName();
		if (functionScope->lookup(symbolName) != NULL) continue;
		functionScope->insert_symbol(decl);
	}
	return functionScope;
}

void FnDecl::checkSemantics(Scope *currentScope) {
	Symbol *symbol = currentScope->lookup(this->getName());
	Scope *parameterScope = symbol->getNestedScope();
	if (symbol->getDecl() != this) {
		ReportError::DeclConflict(this, symbol->getDecl());
		parameterScope = this->ConstructSymbolTable(currentScope);
	}
	currentScope = currentScope->enter_scope(parameterScope);
	for (int i = 0; i < formals->NumElements(); i++) {
		Decl *decl = formals->Nth(i);
		decl->checkSemantics(currentScope);	
	}
	if (body != NULL) {
		body->checkSemantics(currentScope);
	}
}

void FnDecl::SetFunctionBody(Stmt *b) { 
    (body=b)->SetParent(this);
}

void FnDecl::Emit(CodeGenerator *codegen) {

	runtimeStack = new StackFrame(true);
	currentLocalStack = runtimeStack;
	codegen->GenLabel(this->getTacName());
	BeginFunc *codeBegin = codegen->GenBeginFunc();

	for (int i = 0; i < formals->NumElements(); i++) {
		Decl *decl = formals->Nth(i);
		currentLocalStack->createParameter(decl->getName());
	}	

	body->Emit(codegen);	

	codegen->GenEndFunc();	 
	codeBegin->SetFrameSize(currentLocalStack->getVarCount() * CodeGenerator::VarSize);
	currentLocalStack = NULL;
}



