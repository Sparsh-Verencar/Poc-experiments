%{
#include <stdio.h>
%}
%%
(([0-9]+)[a-zA-Z0-9]*)|(if|while|for|return|else|int|float|double) {
    printf("inValid C variable\n");
}
[_a-zA-Z][_a-zA-Z0-9]* {
    printf("Valid C variable\n");
}
%%
int yywrap() {
    return 1;
}
int main() {
    yylex();
    return 0;
}
