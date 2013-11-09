#ifndef _H_symbol
#define _H_symbol

#include "ast.h"
#include "hashtable.h"
#include "ast_decl.h"
#include "ast_type.h"

class Scope;



class Symbol {
    protected:
        const char *name;
        SymbolType type;
	Type *astType;
        Decl *decl;
        Scope *nestedScope;
	ScopeType scopeType;

    public:
        Symbol(Decl *decl);
        Symbol(const char *name, SymbolType type);

        const char* getName() { return name; }
        Decl* getDecl() { return decl; }
        SymbolType getType() { return type; }
        void setNestedScope(Scope *scope) { this->nestedScope = scope; }
        Scope *getNestedScope() { return nestedScope; }
	void setScopeType(ScopeType scopeType) { this->scopeType = scopeType; }
	ScopeType getScopeType() { return scopeType; }
        virtual bool isEquivalentType(Symbol *otherSymbol) { return this->type == otherSymbol->type; }
        virtual bool isCompatibleType(Symbol *otherSymbol, Scope *currentContext) { return false; }
	virtual void describe(const char *indent) {}
	Type* getAstType() { return astType; }
};

class InterfaceSymbol : public Symbol {
    public:
	InterfaceSymbol(Decl *decl);
	void describe(const char *indent);     	
};

class ClassSymbol : public Symbol {
    protected:
	const char* base;
	List<const char*> *interfaces;
    
    public:
	ClassSymbol(Type *type);
	ClassSymbol(Decl *decl);
	const char* getSuperClassName() { return base; }
	List<const char*>* getInterfaces() { return interfaces; }  			
	void describe(const char *indent);     	
};

class FunctionSymbol : public Symbol {
    protected:
	const char *returnType;
        List<const char*> *parameterList;
   
    public:	
	FunctionSymbol(Decl *decl);
	bool matchSignature(FunctionSymbol *otherSymbol);
	const char* getReturnType() { return returnType; }
	int getParameterCount() { return parameterList->NumElements(); }
	List<const char*>* getParameterList() { return parameterList; }	
	void describe(const char *indent);     	
};

class VariableSymbol : public Symbol {
    protected:
	List<const char*> *type;

    public:	  	
	VariableSymbol(Decl *decl);
	List<const char*>* getType() { return type; }
	void describe(const char *indent);     	
};

class ErrorSymbol : public Symbol {
    public:
	ErrorSymbol(Decl *decl);  
        ErrorSymbol(const char *name);
        bool isEquivalentType(Symbol *otherSymbol) { return true; }
        bool isCompatibleType(Symbol *otherSymbol, Scope* currentContext) { return true; }
	void describe(const char *indent);
};

#endif
