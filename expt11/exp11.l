%{
#include<stdio.h>
#include<stdlib.h>
int keywords = 0;
int identifiers = 0;
int operators = 0;
int separators = 0;
%}
%%
(if|else|while|for|do|switch|case|break|continue|return|int|float|double|char|void) {
    printf("KEYWORD: %s\n", yytext);
    keywords++;
}
[(){}\[\];,] {
    printf("SEPARATOR: %s\n", yytext);
    separators++;
}
(==|!=|<=|>=|&&|\|\||[+\-*/%<>=!&|^~]) {
    printf("OPERATOR: %s\n", yytext);
    operators++;
}
[a-zA-Z_][a-zA-Z0-9_]* {
    printf("IDENTIFIER: %s\n", yytext);
    identifiers++;
}
[ \t\n]+ { }
. { }
%%
int yywrap() {
    return 1;
}
int main() {
    yylex();
    printf("\nKEYWORDS: %d\n", keywords);
    printf("IDENTIFIERS: %d\n", identifiers);
    printf("OPERATORS: %d\n", operators);
    printf("SEPARATORS: %d\n", separators);
    printf("TOTAL: %d\n", keywords + identifiers + operators + separators);
    return 0;
}