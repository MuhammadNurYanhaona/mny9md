
%{
#include "symtab.h"
#include "token.h"
%}


DIGIT 	[0-9]
ID 	[a-z]+	 

%%

\/\/.*          ;
[[:space:]]     ;

GO              return MARCH;
TURN            return ROTATE; 
VAR             return VARIABLE;

JUMP            return JUMP;
FOR             return FOR;
STEP            return STEP;
TO              return TO;
DO              return DO;
BEGIN           return COPEN;
END             return CCLOSE;

UP		return UP;
DOWN		return DOWN;
NORTH		return NORTH;
SOUTH		return SOUTH;
EAST		return EAST;
WEST		return WEST;

IF		return IF;
THEN		return THEN;
ELSE		return ELSE;
WHILE		return WHILE;
PROCEDURE	return PROCEDURE;
\{		return COPEN;
\}		return CCLOSE;	
,		return COMMA;

sin             return SIN;
cos             return COS;
sqrt            return SQRT;

;               return SEMICOLON;

==		return EQUAL;
!=		return NOT_EQUAL;
\|\|		return OR;
&&		return AND;
>		return GREATER_THAN;
\<		return LESS_THAN;

\+              return ADD;
-               return SUBTRACT;
\*              return MULTIPLY;
\/              return DIVIDE;

\(              return OPEN;
\)              return CLOSE;
=               return ASSIGN;

{ID}          	{ yylval.n = lookup(yytext); 
                  if (yylval.n==NULL)
		    yylval.n = insert(yytext);
                  return ID;
		}
    
{DIGIT}+\.{DIGIT}+  yylval.d = atof(yytext);  return DECIMAL;
{DIGIT}+            yylval.i = atoi(yytext);  return INTEGER;

.               fprintf(stderr,"Unexpected character %c (%2X)\n",yytext[0],yytext[0]);

%%
