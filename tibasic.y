%{
    
  #include <stdio.h>
  #include <stdlib.h>
  #include <assert.h>  
    
%}

%union {
    int ival;
    char *sval;
    int relop;
}

%token STOREOP VAR NUM
%token ADDOP MULOP POWOP

%token <relop> CONVOP OR AND RELOP COMPEROP PREFIXOP POSTFIXOP


%%

program: statement_list
    ;

statement_list: statement | statement_list statement | ;
    ;

statement: level10 STOREOP VAR
    | level10
    ;

level10: level10 CONVOP
    | level9
    ;

level9: level9 OR level9
    | level8
    ;

level8: level8 AND level8
    | level7
    ;

level7: level7 RELOP level7
    | level6
    ;

level6: level6 ADDOP level6
    | level5
    ;

level5: level5 MULOP level5
    | level4
    ;

level4: level4 COMPEROP level4
    | level3a
    ;

level3a: ADDOP level3a
    | level3
    ;

level3: level3 POWOP level3
    | level2
    ;

level2: level2 POSTFIXOP
    | level1
    ;

level1: PREFIXOP level1
    | level0
    ;

level0: VAR
    | NUM
    | '(' level10 ')'
    ;
%%

int main () {
    yyparse();
}