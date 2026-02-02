%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int pos_count = 0;
int neg_count = 0;
%}

%%
-[0-9]+ {
    neg_count++;
}
[0-9]+ {
    pos_count++;
}
\n {
    printf("Positive freq: %d\n", pos_count);
    printf("Negative freq: %d\n", neg_count);
    return 0;
}
%%

int yywrap()
{
    return 1;
}
int main(int argc, char *argv[])
{
    yylex();
    return 0;
}
