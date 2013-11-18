/* File: ast_type.cc
 * -----------------
 * Implementation of type node classes.
 */
#include "ast_type.h"
#include "ast_decl.h"
#include <string.h>
#include "symbol.h"
#include "scope.h"

 
/* Class constants
 * ---------------
 * These are public constants for the built-in base types (int, double, etc.)
 * They can be accessed with the syntax Type::intType. This allows you to
 * directly access them and share the built-in types where needed rather that
 * creates lots of copies.
 */

Type *Type::intType    = new Type("int");
Type *Type::doubleType = new Type("double");
Type *Type::voidType   = new Type("void");
Type *Type::boolType   = new Type("bool");
Type *Type::nullType   = new Type("null");
Type *Type::stringType = new Type("string");
Type *Type::errorType  = new Type("error"); 

Type::Type(const char *n) {
    Assert(n);
    typeName = strdup(n);
}

bool Type::isCompatibleType(Scope* currentScope, Type* otherType) {
	if (this == Type:: errorType) return true;
	if (otherType == Type::errorType) return true;
	if (this == Type::nullType && otherType->getVariableType() != Basic) return true;
	return this == otherType;
}
	
NamedType::NamedType(Identifier *i) : Type(*i->GetLocation()) {
    Assert(i != NULL);
    (id=i)->SetParent(this);
} 

bool NamedType::isCompatibleType(Scope* currentScope, Type* otherType) {

	if (otherType == Type::nullType || otherType == Type::errorType) return true;
	if (otherType->getVariableType() != Object) return false;

	const char* myName = this->getName();
	const char* otherName = otherType->getName();
	if (strcmp(myName, otherName) == 0) return true;

	Scope *globalScope = currentScope->getClosestScopeByType(GlobalScope);
	Symbol *mySymbol = globalScope->lookup(myName);
	Symbol *otherSymbol = globalScope->lookup(otherName);
	if (otherSymbol->getType() != Class) return false;

	ClassSymbol *otherClass = (ClassSymbol *) otherSymbol;
	while (true) {
		List<const char*> *interfaces = otherClass->getInterfaces();
		for (int i = 0; i < interfaces->NumElements(); i++) {
			if (strcmp(myName, interfaces->Nth(i)) == 0) return true;
		}
		const char* superClass = otherClass->getSuperClassName();
		if (superClass == NULL) break;
		if (strcmp(myName, superClass) == 0) return true;

		otherSymbol = globalScope->lookup(superClass);
		if (otherSymbol != NULL && otherSymbol->getType() == Class) {
			otherClass = (ClassSymbol *) otherSymbol;
		} else break;
	}
	return false;
}

ArrayType::ArrayType(yyltype loc, Type *et) : Type(loc) {
    Assert(et != NULL);
    (elemType=et)->SetParent(this);	 
		
    desc.append("Array of ");
    Type *nestedType = elemType;
    while (nestedType->getVariableType() == Array) {
	desc.append("Array of ");
	nestedType = ((ArrayType *) nestedType)->elemType;
    }
    desc.append(nestedType->getName());
}

bool ArrayType::isCompatibleType(Scope* currentScope, Type* otherType) {

	if (otherType == Type::nullType || otherType == Type::errorType) return true;
	if (otherType->getVariableType() != Array) return false;

	ArrayType *otherArray = (ArrayType *) otherType;
	return this->elemType->isCompatibleType(currentScope, otherArray->elemType);
}

