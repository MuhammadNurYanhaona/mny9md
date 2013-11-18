/* File: ast_type.h
 * ----------------
 * In our parse tree, Type nodes are used to represent and
 * store type information. The base Type class is used
 * for built-in types, the NamedType for classes and interfaces,
 * and the ArrayType for arrays of other types.  
 *
 * pp3: You will need to extend the Type classes to implement
 * the type system and rules for type equivalency and compatibility.
 */
 
#ifndef _H_ast_type
#define _H_ast_type

#include "ast.h"
#include "list.h"
#include <iostream>
#include "string"

enum VariableType {Basic, Object, Array};

class Type : public Node 
{
  protected:
    char *typeName;

  public :
    static Type *intType, *doubleType, *boolType, *voidType,
                *nullType, *stringType, *errorType;

    Type(yyltype loc) : Node(loc) {}
    Type(const char *str);
    
    virtual void PrintToStream(std::ostream& out) { out << typeName; }
    friend std::ostream& operator<<(std::ostream& out, Type *t) { t->PrintToStream(out); return out; }
    virtual bool IsEquivalentTo(Type *other) { return this == other; }
    virtual SymbolType getSymbolType() { return Class; }
    virtual const char* getName() { return typeName; }
    virtual VariableType getVariableType() { return Basic; }
    virtual bool isCompatibleType(Scope* currentScope, Type* otherType);				
};

class NamedType : public Type 
{
  protected:
    Identifier *id;
    
  public:
    NamedType(Identifier *i);
    
    const char* getName() { return id->getName(); }
    Identifier* getIdentifier() { return id; }		
    VariableType getVariableType() { return Object; }			
    void PrintToStream(std::ostream& out) { out << id; }
    bool isCompatibleType(Scope* currentScope, Type* otherType);				
};

class ArrayType : public Type 
{
  protected:
    Type *elemType;
    std::string desc;		

  public:
    ArrayType(yyltype loc, Type *elemType);
 
    VariableType getVariableType() { return Array; }			
    Type* getElementType() { return elemType; }
    const char* getName() { return desc.c_str(); }		   
    void PrintToStream(std::ostream& out) { out << elemType << "[]"; }
    bool isCompatibleType(Scope* currentScope, Type* otherType);				
};

 
#endif
