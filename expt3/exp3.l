%{
#include <stdio.h>
%}

%%
[0-9]+ {printf("Input is integer and real number");}
([0-9]+\.[0-9]+) {printf("Input is real number");}
([a-z]|[A-Z])+ {printf("Input is a word");}
.  { printf("Invalid input\n"); }
%%

int yywrap() {
    return 1;
}//end of file stuff

int main()
{
    yylex();
    return 0;
}
