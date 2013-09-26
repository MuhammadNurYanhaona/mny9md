
%{
#include "symtab.h"
#include "turtle.tab.h"
%}


DIGIT 	[0-9]
ID 	[a-z]+	 

%%

\/\/.*          ;
[[:space:]]     ;

GO              return GO;
TURN            return TURN; 
VAR             return VAR;

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
THEN		;
ELSE		return ELSE;
WHILE		return WHILE;
PROCEDURE	return PROCEDURE;
CALL		return CALL;
PARAM		return PARAM;
\{		return COPEN;
\}		return CCLOSE;

sin             return SIN;
cos             return COS;
sqrt            return SQRT;

;               return SEMICOLON;

==		return EQ;
!=		return NE;
>		return GT;
>=		return GE;
\<		return LT;
\<=		return LE;

&&		return AND;
\|\|		return OR;
!		return NOT;

\+              return PLUS;
-               return MINUS;
\*              return TIMES;
\/              return DIV;

\(              return OPEN;
\)              return CLOSE;
=               return ASSIGN;

{ID}          	{ yylval.n = lookup(yytext); 
                  if (yylval.n==NULL)
		    yylval.n = insert(yytext);
                  return ID;
		}
    
{DIGIT}+\.{DIGIT}+  yylval.d = atof(yytext);  return FLOAT;
{DIGIT}+            yylval.i = atoi(yytext);  return NUMBER;

.               fprintf(stderr,"Unexpected character %c (%2X)\n",yytext[0],yytext[0]);

%%
