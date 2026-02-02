%{
#include<stdio.h>
#include<stdlib.h>
int sum = 0;
int sq = 0;
%}

%%
[0-9]+ {
    sq = atoi(yytext);
    sum += sq*sq;
}
sum {
    printf("Sum:%d", sum);
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