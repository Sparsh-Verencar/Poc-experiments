%{
#include<stdio.h>
#include<stdlib.h>
int count = 0;
%}

%%

(if|while|for|else|int|float|double|return|extern|char|continue|break|do|const|struct|static) {
    printf("Token type: KEYWORD, Matched token: %s\n", yytext);
    count++;
}

[0-9]+(\.[0-9]+)? {
    printf("Token type: CONSTANT, Matched token: %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Token type: IDENTIFIER, Matched token: %s\n", yytext);
}

"=="|"!="|"<="|">="|"&&"|"\\|\\|"|"+"|"-"|"*"|"/"|"%"|"="|"<"|">"|"++"|"--" {
    printf("Token type: OPERATOR, Matched token: %s\n", yytext);
    count++;
}

[ \t\n]+ { /* ignore whitespace */ }

. { /* ignore any other character */ }

%%

int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    printf("\nTotal counted tokens (keywords + operators) = %d\n", count);
    return 0;
}
