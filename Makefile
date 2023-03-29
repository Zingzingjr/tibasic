tiint: y.tab.o lex.yy.o
	gcc -g -o tiint y.tab.o lex.yy.o -lfl

y.tab.o: y.tab.c
	gcc -g -c y.tab.c

lex.yy.o: lex.yy.c
	gcc -g -c lex.yy.c

y.tab.c: tibasic.y
	yacc -dv -Wcounterexamples tibasic.y

lex.yy.c: tibasic.l
	lex -l tibasic.l

clean:
	rm -f y.tab.* lex.yy.* *.0 tiint
