%{
#include<stdio.h>
#include<stdlib.h>
%}

%%
(int|float|char) {
    printf("%s:DATATYPE\n", yytext);
}
[0-9]+|(\.[0-9]+)? {
    printf("%s:CONSTANT\n", yytext);
}
[a-zA-Z0-9]+|_[a-zA-Z0-9]+ {
    printf("%s:IDENTIFIER\n", yytext);
}
[=!@#$%^&*+-/\\;] {
    printf("%s:SYMBOL\n", yytext);
}
%%

int yywrap()
{
    return 1;
}
int main()
{
    yylex();
    return 0;
}