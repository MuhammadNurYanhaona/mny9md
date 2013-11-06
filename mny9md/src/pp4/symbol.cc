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
	this->astType = Type::errorType;
}

Symbol::Symbol(const char *name, SymbolType type) {
        this->name = name;
        this->type = type;
        this->decl = NULL;
        this->nestedScope = NULL;
	this->astType = Type::errorType;
}

InterfaceSymbol::InterfaceSymbol(Decl *decl) : Symbol(decl) {
	astType = new NamedType(decl->getIdentifier());
}

void InterfaceSymbol::describe(const char *indent) {
	printf("%sInterface: %s\n", indent, name);
}

ClassSymbol::ClassSymbol(Type *type) : Symbol(type->getName(), Class) {
	this->astType = type;
	base = NULL;
	interfaces = new List<const char*>;
	this->nestedScope = new Scope(ClassScope);
}

ClassSymbol::ClassSymbol(Decl *decl) : Symbol(decl) {
	ClassDecl* classDecl = (ClassDecl*) decl;
	interfaces = new List<const char*>;
	List<NamedType*> *implements = classDecl->getImplements();
	for (int i = 0; i < implements->NumElements(); i++) {
		interfaces->Append(implements->Nth(i)->getName());
	}
	base = NULL;
	astType = new NamedType(decl->getIdentifier());
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
	parameterList = new List<const char*>;
	List<VarDecl*> *formals = fnDecl->getFormals();
	for (int i = 0; i < formals->NumElements(); i++) {
		parameterList->Append(formals->Nth(i)->getType()->getName());
	}
	returnType = fnDecl->getReturnType()->getName();
	astType = fnDecl->getReturnType();
}

bool FunctionSymbol::matchSignature(FunctionSymbol *otherSymbol) {
	if (strcmp(returnType, otherSymbol->returnType) != 0) return false;
	if (parameterList->NumElements() != otherSymbol->parameterList->NumElements()) return false;
	for (int i = 0; i < parameterList->NumElements(); i++) {
		if (strcmp(parameterList->Nth(i), 
			otherSymbol->parameterList->Nth(i)) != 0) return false;
	}
	return true;
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
	this->type = new List<const char*>; 
	Type *type = varDecl->getType();
	while (type->getVariableType() == Array) {
		ArrayType *arrayType = (ArrayType*) type;
		type = arrayType->getElementType();
		this->type->Append("Array of");	
	}
	this->type->Append(type->getName());
	this->astType = varDecl->getType();
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

ErrorSymbol::ErrorSymbol(const char *name) : Symbol(name, Error) {}

ErrorSymbol::ErrorSymbol(Decl *decl) : Symbol(decl) {
	this->type = Error;
}
