/* File: ast_stmt.h
 * ----------------
 * The Stmt class and its subclasses are used to represent
 * statements in the parse tree.  For each statment in the
 * language (for, if, return, etc.) there is a corresponding
 * node class for that construct. 
 *
 * pp3: You will need to extend the Stmt classes to implement
 * semantic analysis for rules pertaining to statements.
 */


#ifndef _H_ast_stmt
#define _H_ast_stmt

#include "list.h"
#include "ast.h"
#include "scope.h"
#include "symbol.h"

class Decl;
class VarDecl;
class Expr;
  
class Program : public Node
{
  protected:
     List<Decl*> *decls;
     
  public:
     Program(List<Decl*> *declList);
     void Check();
     Scope* ConstructSymbolTable(Scope *currentScope);
     void linkClassScopesByInheritence(Scope *currentScope);	
     void checkSemantics(Scope *currentScope);
     void Emit();		
};

class Stmt : public Node
{
  public:
     Stmt() : Node() {}
     Stmt(yyltype loc) : Node(loc) {}
     virtual void checkSemantics(Scope *currentScope) {}
     virtual void Emit(CodeGenerator *codegen) {}		
};

class StmtBlock : public Stmt 
{
  protected:
    List<VarDecl*> *decls;
    List<Stmt*> *stmts;
    
  public:
    StmtBlock(List<VarDecl*> *variableDeclarations, List<Stmt*> *statements);
    void checkSemantics(Scope *currentScope);
    void Emit(CodeGenerator *codegen);		
};

  
class ConditionalStmt : public Stmt
{
  protected:
    Expr *test;
    Stmt *body;
  
  public:
    ConditionalStmt(Expr *testExpr, Stmt *body);
};

class LoopStmt : public ConditionalStmt 
{
  public:
    LoopStmt(Expr *testExpr, Stmt *body)
            : ConditionalStmt(testExpr, body) {}
    bool isLoop() { return true; }	
};

class ForStmt : public LoopStmt 
{
  protected:
    Expr *init, *step;
  
  public:
    ForStmt(Expr *init, Expr *test, Expr *step, Stmt *body);
    void checkSemantics(Scope *currentScope);	
    void Emit(CodeGenerator *codegen);		
};

class WhileStmt : public LoopStmt 
{
  public:
    WhileStmt(Expr *test, Stmt *body) : LoopStmt(test, body) {}
    void checkSemantics(Scope *currentScope);	
    void Emit(CodeGenerator *codegen);		
};

class IfStmt : public ConditionalStmt 
{
  protected:
    Stmt *elseBody;
  
  public:
    IfStmt(Expr *test, Stmt *thenBody, Stmt *elseBody);
    void checkSemantics(Scope *currentScope);	
    void Emit(CodeGenerator *codegen);		
};

class BreakStmt : public Stmt 
{
  public:
    BreakStmt(yyltype loc) : Stmt(loc) {}
    void checkSemantics(Scope *currentScope);	
    void Emit(CodeGenerator *codegen);		
};

class ReturnStmt : public Stmt  
{
  protected:
    Expr *expr;
  
  public:
    ReturnStmt(yyltype loc, Expr *expr);
    void checkSemantics(Scope *currentScope);	
    void Emit(CodeGenerator *codegen);		
};

class PrintStmt : public Stmt
{
  protected:
    List<Expr*> *args;
    
  public:
    PrintStmt(List<Expr*> *arguments);
    void checkSemantics(Scope *currentScope);	
    void Emit(CodeGenerator *codegen);		
};

class CaseStmt : public Stmt
{
  protected:
    Stmt *value;
    List<Stmt*> *stmts;
    const char *name;

  public:
    CaseStmt(Stmt *value, List<Stmt*> *s);
    CaseStmt(List<Stmt*> *s);
    void checkSemantics(Scope *currentScope);
    bool isLoop() { return true; }	
};

class SwitchStmt : public Stmt
{
  protected:
    Expr *condition;
    List<CaseStmt*> *cases;

  public:
    SwitchStmt(Expr *co, List<CaseStmt*> *ca);
    void checkSemantics(Scope *currentScope);	
};

#endif
