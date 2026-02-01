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

[a-zA-Z]+([ ][a-zA-Z]+)* {
    printf("Valid person name\n");
}

[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} {
    printf("Valid email address\n");
}

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
