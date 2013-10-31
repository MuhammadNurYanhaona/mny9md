#include "symbol.h"
#include "ast_decl.h"
#include "ast_type.h"
#include "scope.h"
#include "list.h"
#include "iostream"
#include "string"

Symbol::Symbol(Decl *decl) {
        name = decl->getName();
        type = decl->getSymbolType();
        this->decl = decl;
        this->nestedScope = NULL;
}

Symbol::Symbol(char *name, SymbolType type) {
        this->name = name;
        this->type = type;
        this->decl = NULL;
        this->nestedScope = NULL;
}

void InterfaceSymbol::describe(const char *indent) {
	printf("%sInterface: %s\n", indent, name);
}

ClassSymbol::ClassSymbol(char *name, SymbolType type) : Symbol(name, type) {
	base = NULL;
	interfaces = new List<char*>;
}

ClassSymbol::ClassSymbol(Decl *decl) : Symbol(decl) {
	ClassDecl* classDecl = (ClassDecl*) decl;
	interfaces = new List<char*>;
	List<NamedType*> *implements = classDecl->getImplements();
	for (int i = 0; i < implements->NumElements(); i++) {
		interfaces->Append(implements->Nth(i)->getName());
	}
	base = NULL;
	if (classDecl->getExtends() != NULL) {
		base = classDecl->getExtends()->getName();
	}
}

void ClassSymbol::describe(const char *indent) {
	printf("%sClass: %s", indent, name);
	if (base != NULL) printf(" extends %s", base);
	int superClasses = interfaces->NumElements();
	if (superClasses > 0) printf(" implements ");
	for (int i = 0; i < superClasses; i++) {
		printf("%s ", interfaces->Nth(i));	
	}
	printf("\n");
}

FunctionSymbol::FunctionSymbol(Decl *decl) : Symbol(decl) {
	FnDecl *fnDecl = (FnDecl*) decl;
	parameterList = new List<char*>;
	List<VarDecl*> *formals = fnDecl->getFormals();
	for (int i = 0; i < formals->NumElements(); i++) {
		parameterList->Append(formals->Nth(i)->getType()->getName());
	}
	returnType = fnDecl->getReturnType()->getName();
}

void FunctionSymbol::describe(const char *indent) {
	printf("%sFunction: %s", indent, name);
	int parameters = parameterList->NumElements();
	for (int i = 0; i < parameters; i++) {
		printf(" %s", parameterList->Nth(i));
	}
	printf(" returns %s\n", returnType);
}

VariableSymbol::VariableSymbol(Decl *decl) : Symbol(decl) {
	VarDecl *varDecl = (VarDecl *) decl;
	this->type = new List<char*>; 
	Type *type = varDecl->getType();
	while (type->getVariableType() == Array) {
		ArrayType *arrayType = (ArrayType*) type;
		type = arrayType->getElementType();
		this->type->Append("Array");	
	}
	this->type->Append(type->getName());
}

void VariableSymbol::describe(const char *indent) {
	printf("%sVariable: %s Type ", indent, name);
	for (int i = 0; i < type->NumElements(); i++) {
		printf("%s ", type->Nth(i));
	}
	printf("\n");
}

void ErrorSymbol::describe(const char *indent) {
	printf("%sError: %s\n", indent, name);
}

ErrorSymbol::ErrorSymbol(Decl *decl) : Symbol(decl) {
	this->type = Error;
}
