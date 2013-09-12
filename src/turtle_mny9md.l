
%{
#include "symtab.h"
#include "token.h"
%}


DIGIT 	[0-9]
ID 	[a-z]+
ARGUMENT_SEPERATOR	[,:]	 

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

IF		return IF;
THEN		return THEN;
ELSE		return ELSE;
WHILE		return WHILE;

PROCEDURE	return PROCEDURE;
RETURNS		return RETURNS;
CALL		return PROCEDURE_CALL;
RETURN		return PROCEDURE_RETURN;

INTEGER		return TYPE_INTEGER;
DECIMAL		return TYPE_DECIMAL;
VOID		return TYPE_VOID;
\{		return PROC_BEGIN;
\}		return PROC_END;	
{ARGUMENT_SEPERATOR}	;

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
