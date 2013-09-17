
/* Old, Some Renamed, Tokens.  */
#define MARCH 258
#define ROTATE 259
#define VARIABLE 260
#define JUMP 261
#define FOR 262
#define STEP 263
#define TO 264
#define DO 265
#define COPEN 266
#define CCLOSE 267
#define SIN 268
#define COS 269
#define SQRT 270
#define DECIMAL 271
#define ID 272
#define INTEGER 273
#define SEMICOLON 274
#define ADD 275
#define SUBTRACT 276
#define MULTIPLY 277
#define DIVIDE 278
#define OPEN 279
#define CLOSE 280
#define ASSIGN 281

/* New Tokens. */
#define IF 283
#define THEN 284
#define ELSE 285
#define WHILE 286
#define PROCEDURE 287
#define EQUAL 291
#define NOT_EQUAL 292
#define GREATER_THAN 293
#define LESS_THAN 294
#define AND 295
#define OR 296
#define COMMA 297
#define UP 298 
#define DOWN 299
#define NORTH 300
#define SOUTH 301
#define EAST 302
#define WEST 303

typedef union YYSTYPE
{ int i; node *n; double d;}
        YYSTYPE;
YYSTYPE yylval;

