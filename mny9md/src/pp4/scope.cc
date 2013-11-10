#include "hashtable.h"
#include "scope.h"
#include "symbol.h"
#include "iostream"
#include "string"

Scope::Scope(ScopeType type) {
        this->type = type;
        this->parent = NULL;
        symbolTable = new Hashtable<Symbol*>;
	this->name = NULL;
	this->base = NULL;
}

Scope* Scope::enter_scope(Scope *newScope) {
	newScope->parent = this; 
	return newScope; 
}

Scope* Scope::exit_scope() { 
	Scope* oldScope = this->parent; 
	this->parent = NULL; 
	return oldScope; 
}

void Scope::insert_symbol(Symbol *symbol) {
	this->symbolTable->Enter(symbol->getName(), symbol, false);
	symbol->setScopeType(this->type);
}

Symbol* Scope::insert_symbol(Decl *decl) {

	SymbolType type = decl->getSymbolType();
	Symbol *symbol;

	if (type == Class) {
		symbol = new ClassSymbol(decl);
	} else if (type == Interface) {
		symbol = new InterfaceSymbol(decl);
	} else if (type == Function) {
		symbol = new FunctionSymbol(decl);
	} else if (type == Variable) {
		symbol = new VariableSymbol(decl);
	} else {
		symbol = new ErrorSymbol(decl);			
	}

	this->symbolTable->Enter(symbol->getName(), symbol, false);
	symbol->setScopeType(this->type);

	return symbol;
}

Symbol* Scope::lookup(const char *key) {
	Symbol *symbol = this->local_lookup(key);
	if (symbol != NULL) return symbol;
	if (this->parent == NULL) return NULL;
	else return this->parent->lookup(key);
}

Symbol* lookup(const char *key, SymbolType symbolType) {
	return NULL;
}

Symbol* Scope::local_lookup(const char *key) {
	//return symbolTable->Lookup(key);
	Symbol *symbol = symbolTable->Lookup(key);
	if (symbol != NULL) return symbol;
	if (this->base == NULL) return NULL;
	else return this->base->local_lookup(key);
}

void Scope::describe(int indent) {
	std::string indentStr = "";
	for (int i = 0; i < indent; i++) {
		indentStr.append("\t");
	}
	const char *strIndent = indentStr.c_str();
	Iterator<Symbol*> symbols = symbolTable->GetIterator();
	Symbol *symbol;
        while((symbol = symbols.GetNextValue()) != NULL) {
       		symbol->describe(strIndent);
		if (symbol->getNestedScope() != NULL) {
			symbol->getNestedScope()->describe(indent + 1);
		}
        }
}

Scope* Scope::getClosestScopeByType(ScopeType t) {
	if (this->type == t) return this;
	else if (this->parent == NULL) return NULL;
	else return parent->getClosestScopeByType(t);
}

bool Scope::isCompatibleClassScope(Scope *otherScope) {
	if (this == otherScope) return true;
	Scope *superScope = this->base;
	while (superScope != NULL) {
		if (superScope == otherScope) return true;
		superScope = superScope->base;
	}
	return false;	
}
