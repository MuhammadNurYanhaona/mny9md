/* File: parser.y
 * --------------
 * Yacc input file to generate the parser for the compiler.
 *
 * pp2: your job is to write a parser that will construct the parse tree
 *      and if no parse errors were found, print it.  The parser should 
 *      accept the language as described in specification, and as augmented 
 *      in the pp2 handout.
 */

%{

/* Just like lex, the text within this first region delimited by %{ and %}
 * is assumed to be C/C++ code and will be copied verbatim to the y.tab.c
 * file ahead of the definitions of the yyparse() function. Add other header
 * file inclusions or C++ variable declarations/prototypes that are needed
 * by your code here.
 */
#include "scanner.h" // for yylex
#include "parser.h"
#include "errors.h"

void yyerror(const char *msg); // standard error-handling routine

%}

/* The section before the first %% is the Definitions section of the yacc
 * input file. Here is where you declare tokens and types, add precedence
 * and associativity options, and so on.
 */
 
/* yylval 
 * ------
 * Here we define the type of the yylval global variable that is used by
 * the scanner to store attibute information about the token just scanned
 * and thus communicate that information to the parser. 
 *
 * pp2: You will need to add new fields to this union as you add different 
 *      attributes to your non-terminal symbols.
 */
%union {
    int integerConstant;
    bool boolConstant;
    char *stringConstant;
    double doubleConstant;
    char identifier[MaxIdentLen+1]; // +1 for terminating null
    Decl *decl;
    VarDecl *var;
    FnDecl *fDecl;
    ClassDecl *cDecl;
    InterfaceDecl *iDecl;
    List<NamedType*> *nTypeList;		
    Type *type;
    NamedType *nType;	
    Stmt *stmt;
    List<Stmt*> *stmtList;
    List<VarDecl*> *varList;
    List<Decl*> *declList;
    Expr *expr;
    List<Expr*> *exprList;	  	
    WhileStmt *whileStmt;
    IfStmt *ifStmt;
    ForStmt *forStmt;
    ReturnStmt *returnStmt;
    BreakStmt *breakStmt;
    PrintStmt *printStmt;
    SwitchStmt *switchStmt;
    CaseStmt *caseStmt;
    List<CaseStmt*> *caseStmtList;	    	
}


/* Tokens
 * ------
 * Here we tell yacc about all the token types that we are using.
 * Yacc will assign unique numbers to these and export the #define
 * in the generated y.tab.h header file.
 */
%token  T_Void T_Bool T_Int T_Double T_String T_Class 
%token  T_Null T_Extends T_This T_Interface T_Implements
%token  T_While T_For T_If T_Return T_Break
%token  T_NewArray T_Print T_ReadInteger T_ReadLine
%token	T_Switch T_Case T_Default
%right	T_Then T_Else

%token   <identifier> T_Identifier
%token   <stringConstant> T_StringConstant 
%token   <integerConstant> T_IntConstant
%token   <doubleConstant> T_DoubleConstant
%token   <boolConstant> T_BoolConstant

%left ','
%right T_Assignment
%left T_Or
%left T_And
%left T_Equal T_NotEqual
%left '<' '>' T_LessEqual T_GreaterEqual
%left '+' '-'
%left '%' '*' '/'
%right '!' T_New T_Unary
%left T_LValue
%left '.' '[' T_Dims T_Call T_Increment T_Decrement

/* Non-terminal types
 * ------------------
 * In order for yacc to assign/access the correct field of $$, $1, we
 * must to declare which field is appropriate for the non-terminal.
 * As an example, this first type declaration establishes that the DeclList
 * non-terminal uses the field named "declList" in the yylval union. This
 * means that when we are setting $$ for a reduction for DeclList ore reading
 * $n which corresponds to a DeclList nonterminal we are accessing the field
 * of the union named "declList" which is of type List<Decl*>.
 * pp2: You'll need to add many of these of your own.
 */
%type <declList>  	DeclList Fields Prototypes 
%type <decl>      	Decl Field
%type <type>      	Type 
%type <nType>		Extends
%type <nTypeList>	Implements IdentifierList
%type <var>       	Variable VarDecl
%type <varList>   	Formals FormalList OneOrMoreVar
%type <fDecl>     	FnDecl FnHeader Prototype
%type <cDecl>		ClassDecl
%type <iDecl>		InterfaceDecl
%type <stmt>      	StmtBlock Stmt
%type <stmtList>	OneOrMoreStmt StmtList
%type <whileStmt> 	WhileStmt
%type <forStmt>   	ForStmt
%type <ifStmt>    	IfStmt
%type <breakStmt> 	BreakStmt
%type <returnStmt> 	ReturnStmt
%type <printStmt>	PrintStmt
%type <expr>	  	Expr OptionalExpr LValueWithPostfix LValue Constant Call
%type <exprList>	ExprList Actuals
%type <switchStmt>	SwitchStmt
%type <caseStmt>	Case Default
%type <caseStmtList>	Cases CaseBlock
	
%%
/* Rules
 * -----
 * All productions and actions should be placed between the start and stop
 * %% markers which delimit the Rules section.
	 
 */
Program   :    DeclList            { 
                                      @1; 
                                      /* pp2: The @1 is needed to convince 
                                       * yacc to set up yylloc. You can remove 
                                       * it once you have other uses of @n*/
                                      Program *program = new Program($1);
                                      // if no errors, advance to next phase
                                      if (ReportError::NumErrors() == 0) 
					  program->Check();
                                      if (ReportError::NumErrors() == 0) 
					  program->Emit();
                                    }
          ;

DeclList  :    DeclList Decl        { ($$=$1)->Append($2); }
          |    Decl                 { ($$ = new List<Decl*>)->Append($1); };

Decl      :    VarDecl              { $$=$1; }
          |    FnDecl               { $$=$1; }
	  |    ClassDecl	    { $$=$1; }	
	  |    InterfaceDecl 	    { $$=$1; } 	
;

VarDecl   :    Variable ';' 	    { $$=$1; }
; 

Variable   :   Type T_Identifier    { $$ = new VarDecl(new Identifier(@2, $2), $1); }
;

Type      :    T_Int                { $$ = Type::intType; }
          |    T_Bool               { $$ = Type::boolType; }
          |    T_String             { $$ = Type::stringType; }
          |    T_Double             { $$ = Type::doubleType; }
          |    T_Identifier         { $$ = new NamedType(new Identifier(@1,$1)); }
          |    Type T_Dims          { $$ = new ArrayType(Join(@1, @2), $1); }
;

FnDecl    :    FnHeader StmtBlock   { ($$=$1)->SetFunctionBody($2); }
;

FnHeader  :    Type T_Identifier '(' Formals ')'  
                                    { $$ = new FnDecl(new Identifier(@2, $2), $1, $4); }
          |    T_Void T_Identifier '(' Formals ')' 
                                    { $$ = new FnDecl(new Identifier(@2, $2), Type::voidType, $4); }
;

Formals   :    FormalList           { $$ = $1; }
          |    /* empty */          { $$ = new List<VarDecl*>; }
;

FormalList:    FormalList ',' Variable  
                                    { ($$=$1)->Append($3); }
          |    Variable             { ($$ = new List<VarDecl*>)->Append($1); }
;

StmtBlock	: '{' OneOrMoreVar '}'	{ $$ =  new StmtBlock($2, new List<Stmt*>); }
		| '{' OneOrMoreVar OneOrMoreStmt '}' { $$ = new StmtBlock($2, $3); }
		| '{' OneOrMoreStmt '}'	{ $$ = new StmtBlock(new List<VarDecl*>, $2); }
		| '{' '}'	{ $$= new StmtBlock(new List<VarDecl*>, new List<Stmt*>); }	
;

OneOrMoreVar	: OneOrMoreVar VarDecl	{ ($$=$1)->Append($2); }
		| VarDecl		{ ($$ = new List<VarDecl*>)->Append($1); }
;

OneOrMoreStmt	: OneOrMoreStmt Stmt	{ ($$=$1)->Append($2); }
		| Stmt 			{ ($$ = new List<Stmt*>)->Append($1); }
;

ClassDecl : T_Class T_Identifier Extends Implements '{' Fields '}'
		{ $$ = new ClassDecl(new Identifier(@2, $2), $3, $4, $6); }
;

Extends	: T_Extends T_Identifier { $$ = new NamedType(new Identifier(@2, $2)); }	
	|			 { $$ = NULL; }
;

Implements	: T_Implements IdentifierList	{ $$ = $2; }
		|				{ $$ = new List<NamedType*>; }
;

IdentifierList	: T_Identifier		
			{ ($$ = new List<NamedType*>)->Append(new NamedType(new Identifier(@1, $1))); }					
		| IdentifierList ',' T_Identifier
			{ ($$=$1)->Append(new NamedType(new Identifier(@3, $3))); }
;

Fields	: Fields Field	{ ($$=$1)->Append($2); }
	|		{ $$ = new List<Decl*>; }	
;

Field	: VarDecl	{ $$=$1; }
	| FnDecl	{ $$=$1; }
;

InterfaceDecl	: T_Interface T_Identifier '{' Prototypes '}'
			{ $$ = new InterfaceDecl(new Identifier(@2, $2), $4); }
;

Prototypes	: Prototypes Prototype	{ ($$=$1)->Append($2); }
		|			{ $$ = new List<Decl*>; }
;

Prototype	: FnHeader ';'	{ $$=$1; }
;

Stmt	:	';'		{ $$ = new EmptyExpr(); }	
	|	Expr ';'	{ $$ = $1; }
	|	IfStmt		{ $$ = $1; }
	|	WhileStmt	{ $$ = $1; }
	|	ForStmt		{ $$ = $1; }
	|	BreakStmt	{ $$ = $1; }
	|	ReturnStmt	{ $$ = $1; }
	|	PrintStmt	{ $$ = $1; }
	|	StmtBlock	{ $$ = $1; }
	| 	SwitchStmt	{ $$ = $1; }
;

IfStmt	: T_If '(' Expr ')' Stmt %prec T_Then 	{ $$ = new IfStmt($3, $5, NULL); }
	| T_If '(' Expr ')' Stmt T_Else Stmt	{ $$ = new IfStmt($3, $5, $7); }
;

WhileStmt : T_While '(' Expr ')' Stmt	{ $$ = new WhileStmt($3, $5); }
;

ForStmt	  : T_For '(' OptionalExpr ';' Expr ';' OptionalExpr ')' Stmt 
					{ $$ = new ForStmt($3, $5, $7, $9); }
;

ReturnStmt  : T_Return OptionalExpr ';' { $$ = new ReturnStmt(@2, $2); }
;

BreakStmt  : T_Break ';'	{ $$ = new BreakStmt(@1); }
;		 

PrintStmt   : T_Print '(' ExprList ')' ';'	{ $$ = new PrintStmt($3); }
;

SwitchStmt	: T_Switch '(' Expr ')' CaseBlock	
				{ $$ = new SwitchStmt($3, $5); }
;

CaseBlock	: '{' Cases Default '}'	{ ($$ = $2)->Append($3); }
		| '{' Cases '}'		{ $$ = $2; }
;

Cases	: Cases Case	{ ($$ = $1)->Append($2); }
	| Case		{ ($$ = new List<CaseStmt*>)->Append($1); }
;

Case	: T_Case T_IntConstant ':' StmtList	{ $$ = new CaseStmt(new IntConstant(@2, $2), $4); }
;

Default	: T_Default ':' StmtList	{ $$ = new CaseStmt($3); }
;

StmtList	: OneOrMoreStmt	{ $$ = $1; }
		|		{ $$ = new List<Stmt*>; }	
;	

ExprList : Expr			{ ($$ = new List<Expr*>)->Append($1); }
	 | ExprList ',' Expr	{ ($$=$1)->Append($3); }
;

OptionalExpr : Expr	{ $$ = $1; } 
	     | 		{ $$ = new EmptyExpr(); }	
;

Expr	: LValueWithPostfix '=' Expr %prec T_Assignment	
						{ $$ = new AssignExpr($1, new Operator(@2, "="), $3); }
	| Constant				{ $$ = $1; }
	| LValueWithPostfix			{ $$ = $1; }
	| T_This				{ $$ = new This(@1); }
	| Call %prec T_Call			{ $$ = $1; }
	| '(' Expr ')'				{ $$ = $2; }
	| Expr '+' Expr				{ $$ = new ArithmeticExpr($1, new Operator(@2, "+"), $3); }
	| Expr '-' Expr				{ $$ = new ArithmeticExpr($1, new Operator(@2, "-"), $3); }
	| Expr '*' Expr				{ $$ = new ArithmeticExpr($1, new Operator(@2, "*"), $3); }
	| Expr '/' Expr				{ $$ = new ArithmeticExpr($1, new Operator(@2, "/"), $3); }
	| Expr '%' Expr				{ $$ = new ArithmeticExpr($1, new Operator(@2, "%"), $3); }
	| '-' Expr %prec T_Unary		{ $$ = new ArithmeticExpr(new Operator(@1, "-"), $2); }
	| Expr '<' Expr				{ $$ = new RelationalExpr($1, new Operator(@2, "<"), $3); }
	| Expr T_LessEqual Expr			{ $$ = new RelationalExpr($1, new Operator(@2, "<="), $3); }
	| Expr '>' Expr				{ $$ = new RelationalExpr($1, new Operator(@2, ">"), $3); }
	| Expr T_GreaterEqual Expr		{ $$ = new RelationalExpr($1, new Operator(@2, ">="), $3); }
	| Expr T_Equal Expr			{ $$ = new EqualityExpr($1, new Operator(@2, "=="), $3); }
	| Expr T_NotEqual Expr 			{ $$ = new EqualityExpr($1, new Operator(@2, "!="), $3); }
	| Expr T_And Expr			{ $$ = new LogicalExpr($1, new Operator(@2, "&&"), $3); }
	| Expr T_Or Expr			{ $$ = new LogicalExpr($1, new Operator(@2, "||"), $3); }
	| '!' Expr				{ $$ = new LogicalExpr(new Operator(@1, "!"), $2); }
	| T_ReadInteger '(' ')'			{ $$ = new ReadIntegerExpr(Join(@1, @3)); }
	| T_ReadLine '(' ')'			{ $$ = new ReadLineExpr(Join(@1, @3)); }
	| T_New '(' T_Identifier ')'		{ $$ = new NewExpr(Join(@1, @4), new NamedType(new Identifier(@3, $3))); }
	| T_NewArray '(' Expr ',' Type ')'	{ $$ = new NewArrayExpr(Join(@1, @6), $3, $5); }
	| Expr T_Increment			{ $$ = new PostfixExpr($1, new Operator(@2, "++")); }
	| Expr T_Decrement			{ $$ = new PostfixExpr($1, new Operator(@2, "--")); }
;

LValueWithPostfix	: LValue T_Increment	{ $$ = new PostfixExpr($1, new Operator(@2, "++")); }
			| LValue T_Decrement	{ $$ = new PostfixExpr($1, new Operator(@2, "--")); }
			| LValue %prec T_LValue	{ $$ = $1; }
;

LValue	: T_Identifier				{ $$ = new FieldAccess(NULL, new Identifier(@1, $1)); }
	| Expr '.' T_Identifier			{ $$ = new FieldAccess($1, new Identifier(@3, $3)); }
	| Expr '[' Expr ']' %prec T_Dims	{ $$ = new ArrayAccess(Join(@1, @4), $1, $3); }
;

Call	: T_Identifier '(' Actuals ')'		{ $$ = new Call(Join(@1, @4), NULL, new Identifier(@1, $1), $3); }
	| Expr '.' T_Identifier '(' Actuals ')' { $$ = new Call(Join(@1, @6), $1, new Identifier(@3, $3), $5); } 
;

Actuals	: ExprList	{ $$ = $1; }
	|		{ $$ = new List<Expr*>; }
;

Constant	: T_IntConstant		{ $$ = new IntConstant(@1, $1); }
		| T_DoubleConstant	{ $$ = new DoubleConstant(@1, $1); }
		| T_BoolConstant	{ $$ = new BoolConstant(@1, $1); }
		| T_StringConstant	{ $$ = new StringConstant(@1, $1); }
		| T_Null 		{ $$ = new NullConstant(@1); }
;

%%

/* The closing %% above marks the end of the Rules section and the beginning
 * of the User Subroutines section. All text from here to the end of the
 * file is copied verbatim to the end of the generated y.tab.c file.
 * This section is where you put definitions of helper functions.
 */

/* Function: InitParser
 * --------------------
 * This function will be called before any calls to yyparse().  It is designed
 * to give you an opportunity to do anything that must be done to initialize
 * the parser (set global variables, configure starting state, etc.). One
 * thing it already does for you is assign the value of the global variable
 * yydebug that controls whether yacc prints debugging information about
 * parser actions (shift/reduce) and contents of state stack during parser.
 * If set to false, no information is printed. Setting it to true will give
 * you a running trail that might be helpful when debugging your parser.
 * Please be sure the variable is set to false when submitting your final
 * version.
 */
void InitParser()
{
   PrintDebug("parser", "Initializing parser");
   yydebug = false;
}
