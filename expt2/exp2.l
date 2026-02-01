%{
#include <stdio.h>
int file_line_count = 0;
%}

%%
\n      { file_line_count++; }
<<EOF>>   { printf("%d\n", file_line_count+1);return 0; }
.       ;
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
