%{
#include <stdio.h>
int linecount = 1;
%}

%%
\n              { linecount++; printf("\n"); }
[a-zA-Z0-9]+    { printf("%d %s ", linecount, yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
