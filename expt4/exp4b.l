%{
#include <stdio.h>
%}
%%
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
