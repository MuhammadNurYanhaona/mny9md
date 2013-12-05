/* File: ast.h
 * ----------- 
 * This file defines the abstract base class Node and the concrete 
 * Identifier and Error node subclasses that are used through the tree as 
 * leaf nodes. A parse tree is a hierarchical collection of ast nodes (or, 
 * more correctly, of instances of concrete subclassses such as VarDecl,
 * ForStmt, and AssignExpr).
 * 
 * Location: Each node maintains its lexical location (line and columns in 
 * file), that location can be NULL for those nodes that don't care/use 
 * locations. The location is typcially set by the node constructor.  The 
 * location is used to provide the context when reporting semantic errors.
 *
 * Parent: Each node has a pointer to its parent. For a Program node, the 
 * parent is NULL, for all other nodes it is the pointer to the node one level
 * up in the parse tree.  The parent is not set in the constructor (during a 
 * bottom-up parse we don't know the parent at the time of construction) but 
 * instead we wait until assigning the children into the parent node and then 
 * set up links in both directions. The parent link is typically not used 
 * during parsing, but is more important in later phases.
 *
 * Semantic analysis: For pp3 you are adding "Check" behavior to the ast
 * node classes. Your semantic analyzer should do an inorder walk on the
 * parse tree, and when visiting each node, verify the particular
 * semantic rules that apply to that construct.

 */

#ifndef _H_ast
#define _H_ast

#include <stdlib.h>   // for NULL
#include "location.h"
#include <iostream>
#include "hashtable.h"
#include "tac.h"

class Scope;

enum SymbolType {Variable, Class, Interface, Function, Error, NotApplicable};
enum ScopeType {GlobalScope, InterfaceScope, ClassScope, FunctionScope, StatementBlockScope, ExecutionScope};

class VarIndexMap {
  public:
    const char *name;
    int index;
    VarIndexMap(const char *name, int index) {
        this->name = name;
        this->index = index;
    }
};

class StackFrame {

     private:
	bool localStack;
	int labelCount;	
	int variableCount;
	int parameterCount;
	int currentLoopMarker;
	Hashtable<Location*> *items;
	Hashtable<VarIndexMap*> *varIndexes;
	const char* currentClass;

     public:
	StackFrame(bool localStack) {
		this->localStack = localStack;
		labelCount = 0;
		variableCount = 0;
		parameterCount = 0;
		items = new Hashtable<Location*>;
		varIndexes = new Hashtable<VarIndexMap*>;
		currentClass = NULL;
	}

	Location* getLocation(const char *var) { return items->Lookup(var); }
	void removeLocalVariable(const char *var, Location *location) { items->Remove(var, location); }	 
	int getVarCount() { return variableCount; }
	Location* createLocalVar(const char *name);
	Location* createParameter(const char *name);
	Location* createTemp();
	Location* insertThisPointer();
	int getNextLabelNum() { return labelCount++; }
	void setLoopMarker(int mark) { currentLoopMarker = mark; }
	int getCurrentLoopMarker() { return currentLoopMarker; }
	void setVarIndexMap(Hashtable<VarIndexMap*> *varIndexes) { this->varIndexes = varIndexes; }
	VarIndexMap* getVariableIndex(const char *var) { return varIndexes->Lookup(var); }
	void setCurrentClass(const char *className) { currentClass = className; }
	const char* getCurrentClass() { return currentClass; }
	void printVariables();
};



class Node 
{
  protected:
    yyltype *location;
    Node *parent;

  public:
    static StackFrame *globalStack;
    static StackFrame *currentLocalStack;     		
	
    Node(yyltype loc);
    Node();
    
    yyltype *GetLocation()   { return location; }
    void SetParent(Node *p)  { parent = p; }
    Node *GetParent()        { return parent; }
    virtual SymbolType getSymbolType() { return NotApplicable; }
    virtual Scope* ConstructSymbolTable(Scope *currentScope) {return currentScope;}
    virtual void checkSemantics(Scope *currentScope) {}
    virtual bool isLoop() { return false; }				
};
   

class Identifier : public Node 
{
  protected:
    char *name;
    
  public:
    Identifier(yyltype loc, const char *name);
    friend std::ostream& operator<<(std::ostream& out, Identifier *id) { return out << id->name; }
    char* getName() {return name;}	
};


// This node class is designed to represent a portion of the tree that 
// encountered syntax errors during parsing. The partial completed tree
// is discarded along with the states being popped, and an instance of
// the Error class can stand in as the placeholder in the parse tree
// when your parser can continue after an error.
class Error : public Node
{
  public:
    Error() : Node() {}
};



#endif
