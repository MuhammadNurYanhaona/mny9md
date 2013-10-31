#include "hashtable.h"
#include "scope.h"
#include "symbol.h"
#include "iostream"
#include "string"

Scope::Scope(ScopeType type) {
        this->type = type;
        this->parent = NULL;
        symbolTable = new Hashtable<Symbol*>;
}

Scope* Scope::enter_scope(ScopeType type) {
        Scope *newScope = new Scope(type);
        newScope->parent = this;
        return newScope;
}

void Scope::insert_symbol(Symbol *symbol) {
	this->symbolTable->Enter(symbol->getName(), symbol, false);
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
	return symbol;
}

Symbol* Scope::lookup(char *key) {
	Symbol *symbol = symbolTable->Lookup(key);
	if (symbol != NULL) return symbol;
	if (this->parent == NULL) return NULL;
	else return this->parent->lookup(key);
}

Symbol* Scope::local_lookup(char *key) {
	return symbolTable->Lookup(key);
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

