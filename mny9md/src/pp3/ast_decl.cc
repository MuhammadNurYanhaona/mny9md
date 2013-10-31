/* File: ast_decl.cc
 * -----------------
 * Implementation of Decl node classes.
 */
#include "ast_decl.h"
#include "ast_type.h"
#include "ast_stmt.h"
#include "errors.h"
        
         
Decl::Decl(Identifier *n) : Node(*n->GetLocation()) {
    Assert(n != NULL);
    (id=n)->SetParent(this); 
}

VarDecl::VarDecl(Identifier *n, Type *t) : Decl(n) {
    Assert(n != NULL && t != NULL);
    (type=t)->SetParent(this);
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
	if (symbol->getDecl() != this) {
		ReportError::DeclConflict(this, symbol->getDecl());
		classScope = this->ConstructSymbolTable(currentScope);
	} else {
		classScope = symbol->getNestedScope();
	}
	if (this->extends != NULL) {
		Symbol* base = currentScope->lookup(this->extends->getName());
		if (base != NULL) {
			currentScope = currentScope->enter_scope(base->getNestedScope());
		} else {
			ReportError::IdentifierNotDeclared(this->extends->getIdentifier(), LookingForClass);
		}
	}	
}

InterfaceDecl::InterfaceDecl(Identifier *n, List<Decl*> *m) : Decl(n) {
    Assert(n != NULL && m != NULL);
    (members=m)->SetParentAll(this);
}

Scope* InterfaceDecl::ConstructSymbolTable(Scope *currentScope) {
	Scope *interfaceScope = new Scope(InterfaceScope);
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
	
FnDecl::FnDecl(Identifier *n, Type *r, List<VarDecl*> *d) : Decl(n) {
    Assert(n != NULL && r!= NULL && d != NULL);
    (returnType=r)->SetParent(this);
    (formals=d)->SetParentAll(this);
    body = NULL;
}

Scope* FnDecl::ConstructSymbolTable(Scope *currentScope) {
	Scope *functionScope = new Scope(FunctionScope);
	for (int i = 0; i < formals->NumElements(); i++) {
        	Decl *decl = formals->Nth(i);
		char *symbolName = decl->getName();
		if (functionScope->lookup(symbolName) != NULL) continue;
		functionScope->insert_symbol(decl);
	}
	return functionScope;
}

void FnDecl::SetFunctionBody(Stmt *b) { 
    (body=b)->SetParent(this);
}



