

eins.out: eins.tlt scanner 
	./scanner < eins.tlt > eins.out

lex.yy.o:  lex.yy.c token.h symtab.h
	gcc -c lex.yy.c

lex.yy.c: turtle_mny9md.l
	flex turtle_mny9md.l
	
scanner:  lex.yy.o symtab.c
	gcc lex.yy.o symtab.c -lfl -o scanner 

clean:
	rm -f scanner lex.* 

