#ifndef _H_scope
#define _H_scope

#include "ast.h"
#include "hashtable.h"

class Symbol;
class Decl;

class Scope {
    protected:
	Scope *parent;
	ScopeType type;
	Hashtable<Symbol*> *symbolTable;
	const char* name;
	
    public:
	Scope(ScopeType type);

	Scope* enter_scope(Scope *newScope) { newScope->parent = this; return newScope; }
	Symbol* insert_symbol(Decl *decl);
	void insert_symbol(Symbol *symbol);
	Symbol* lookup(const char *key);
	Symbol* local_lookup(const char *key);
	Scope* exit_scope() { Scope* oldScope = this->parent; this->parent = NULL; return oldScope; }
	void describe(int indent);
	void setName(const char* n) { name = n; }
	const char* getName() { return name; }
	Scope* getClosestScopeByType(ScopeType t);		
 	Iterator<Symbol*> getAllLocalSymbols() { return symbolTable->GetIterator(); }
};

#endif
