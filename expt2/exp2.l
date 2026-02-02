%{
#include <stdio.h>
int file_line_count = 0;
int file_word_count = 0;
%}

%%
\n      { file_line_count++; }
[a-zA-Z]+ { printf("word found:%s\n", yytext); file_word_count++;}
<<EOF>>   { 
    printf("file line count:%d\n", file_line_count+1);
    printf("file word count:%d\n", file_word_count);
    return 0; 
}
.       ;
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
