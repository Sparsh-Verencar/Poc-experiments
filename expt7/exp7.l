%{
#include<stdio.h>
#include<stdlib.h>
int sum = 0;
int count = 0; 
%}
%%
[0-9]+ {
    sum += atoi(yytext);
    count++;
}
avg {
    printf("Average:%.2f", (float)sum/count);
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