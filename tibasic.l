%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <assert.h>
    #include "y.tab.h"
    
%}

variable [A-Z]
number [0-9]+
whitespace [ \t]+

%%

"->" {fprintf(stderr, "[STORE]"); return STOREOP;}

{variable} {fprintf(stderr, "[VAR:%s]", yytext); return VAR;}
{number} {fprintf(stderr, "[NUM:%d]", yylval.ival = atoi(yytext)); return NUM;}
{whitespace} {;}/* ignore */

%%

int yyerror() {
    fprintf(stderr, "error\n");
}