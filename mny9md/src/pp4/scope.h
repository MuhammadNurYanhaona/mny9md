#ifndef _H_scope
#define _H_scope

#include "ast.h"
#include "hashtable.h"

class Symbol;
class Decl;

class Scope {

    protected:
	Scope *base;
	Scope *parent;
	ScopeType type;
	Hashtable<Symbol*> *symbolTable;
	const char* name;
	
    public:
	Scope(ScopeType type);

	Scope* enter_scope(Scope *newScope);
	Symbol* insert_symbol(Decl *decl);
	void insert_symbol(Symbol *symbol);
	Symbol* lookup(const char *key);
	Symbol* lookup(const char *key, SymbolType symbolType);
	Symbol* local_lookup(const char *key);
	Scope* exit_scope();
	void describe(int indent);
	void setName(const char* n) { name = n; }
	const char* getName() { return name; }
	Scope* getClosestScopeByType(ScopeType t);		
 	Iterator<Symbol*> getAllLocalSymbols() { return symbolTable->GetIterator(); }
	void setBase(Scope *baseScope) { this->base = baseScope; }
	bool isCompatibleClassScope(Scope *otherScope);
};

#endif
