#ifndef _H_symbol
#define _H_symbol

#include "hashtable.h"
#include "ast_decl.h"

class Scope;

class Symbol {
    protected:
        char *name;
        SymbolType type;
        Decl *decl;
        Scope *nestedScope;

    public:
        Symbol(Decl *decl);
        Symbol(char *name, SymbolType type);

        char* getName() { return name; }
        Decl* getDecl() { return decl; }
        SymbolType getType() { return type; }
        void setNestedScope(Scope *scope) { this->nestedScope = scope; }
        Scope *getNestedScope() { return nestedScope; }
        virtual bool isEquivalentType(Symbol *otherSymbol) { return this->type == otherSymbol->type; }
        virtual bool isCompatibleType(Symbol *otherSymbol) { return false; }
	virtual void describe(const char *indent) {}
};

class InterfaceSymbol : public Symbol {
    public:
	InterfaceSymbol(Decl *decl) : Symbol(decl) {}
	void describe(const char *indent);     	
};

class ClassSymbol : public Symbol {
    protected:
	char* base;
	List<char*> *interfaces;
    
    public:
	ClassSymbol(char *name, SymbolType type);
	ClassSymbol(Decl *decl);  			
	void describe(const char *indent);     	
};

class FunctionSymbol : public Symbol {
    protected:
	char *returnType;
        List<char*> *parameterList;
   
    public:	
	FunctionSymbol(Decl *decl);	
	void describe(const char *indent);     	
};

class VariableSymbol : public Symbol {
    protected:
	List<char*> *type;

    public:	  	
	VariableSymbol(Decl *decl);
	void describe(const char *indent);     	
};

class ErrorSymbol : public Symbol {
    public:
	ErrorSymbol(Decl *decl);  
        bool isEquivalentType(Symbol *otherSymbol) { return true; }
        bool isCompatibleType(Symbol *otherSymbol) { return true; }
	void describe(const char *indent);
};

#endif
