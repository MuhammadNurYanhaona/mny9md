
%{
#include <stdio.h>
#include "symtab.h"
%}

%union { int i; node *n; double d;}

%token GO TURN VAR JUMP
%token FOR STEP TO DO
%token COPEN CCLOSE
%token <d> FLOAT
%token <n> ID               
%token <i> NUMBER       
%token SEMICOLON OPEN CLOSE ASSIGN
%token UP DOWN NORTH SOUTH EAST WEST

%left OR
%left AND
%left EQ NE
%left GT GE LT LE
%left PLUS MINUS
%left TIMES DIV
%right NOT SIN COS SQRT

%token IF WHILE
%right CLOSE ELSE
%token PROCEDURE CALL PARAM

%type <n> decl
%type <n> decllist

%%
program: head decllist stmtlist tail;

head: { printf("%%!PS Adobe\n"
               "\n"
	       "newpath 0 0 moveto\n"
	       );
      };

tail: { printf("stroke\n"); };

decllist: ;
decllist: decllist decl;

decl: VAR ID SEMICOLON {printf("/tlt%s 0 def\n",$2->symbol);};

stmtlist: ;
stmtlist: stmtlist stmt ;

stmt: ID ASSIGN expr SEMICOLON {printf("/tlt%s exch store\n",$1->symbol);} ;
stmt: GO expr SEMICOLON {printf("0 rlineto\n");};
stmt: JUMP expr SEMICOLON {printf("0 rmoveto\n");};
stmt: TURN expr SEMICOLON {printf("rotate\n");};
stmt: UP SEMICOLON {printf("90 rotate\n");}
stmt: DOWN SEMICOLON {printf("-90 rotate\n");}

stmt: FOR ID ASSIGN expr 
          STEP expr
	  TO expr
	  DO {printf("{ /tlt%s exch store\n",$2->symbol);} 
	     stmt {printf("} for\n");};

stmt: ifbegin ifend
ifbegin: IF OPEN expr {printf("\n{");} 
ifend: CLOSE stmt {printf("} if \n");};
ifend: CLOSE stmt ELSE {printf("} {");} stmt {printf("} ifelse \n");};

stmt: WHILE {printf("\n{");} 
	OPEN expr CLOSE {printf("{} {exit} ifelse \n");} 
	stmt {printf("} loop \n");};

stmt: PROCEDURE ID {printf("\n/proc%s {", $2->symbol);}  
	COPEN decllist stmtlist CCLOSE { printf("} def\n");};

stmt: COPEN stmtlist CCLOSE ;

stmt: CALL ID factorlist SEMICOLON {printf("proc%s\n", $2->symbol);};

expr: expr OR expr {printf("or ");};	 
expr: expr AND expr {printf("and ");};	 
expr: expr EQ expr {printf("eq ");};	 
expr: expr NE expr {printf("ne ");};	 
expr: expr GE expr {printf("ge ");};	 
expr: expr GT expr {printf("gt ");};	 
expr: expr LE expr {printf("le ");};	 
expr: expr LT expr {printf("lt ");};	 
expr: expr PLUS expr {printf("add ");};	 
expr: expr MINUS expr {printf("sub ");};	 
expr: expr TIMES expr {printf("mul ");};	 
expr: expr DIV expr {printf("div ");};
expr: factor;

factorlist: ;
factorlist: factorlist factor ;

factor: MINUS atomic { printf("neg ");};
factor: PLUS atomic ;
factor: SIN factor { printf("sin ");};
factor: COS factor { printf("cos ");};
factor: SQRT factor { printf("sqrt ");};
factor: NOT factor { printf("not ");};
factor: atomic;

atomic: OPEN expr CLOSE;
atomic: NUMBER {printf("%d ",$1);};
atomic: FLOAT {printf("%f ",$1);};
atomic: ID {printf("tlt%s ", $1->symbol);};
atomic: PARAM ;


%%
int yyerror(char *msg)
{  fprintf(stderr,"Error: %s\n",msg);
   return 0;
}

int main(void)
{   yyparse();
    return 0;
}

