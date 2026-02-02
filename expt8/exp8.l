%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
char word[50];
int count = 0;
%}

%%
[a-zA-Z0-9]+ {
    if(strcmp(word, yytext) == 0)
        count++;
}
<<EOF>> {
    printf("Frequency of %s: %d", word, count);
    return 0;
}
%%

int yywrap()
{
    return 1;
}
int main(int argc, char *argv[])
{
    strcpy(word, argv[1]);
    yylex();
    return 0;
}

//input format >>exp8out <word> < <text-file>.txt
//where >> is terminal, don't type that