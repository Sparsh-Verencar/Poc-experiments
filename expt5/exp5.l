%{
#include <stdio.h>
#include <stdlib.h>

int num = 0, count = 0, r = 0, digit = 0, i = 0;
char a[20];
%}

%%
[0-9]+ {
    num = atoi(yytext);
    count = 0;

    while (num != 0) {
        r = num % 8;
        digit = '0' + r;
        a[count++] = digit;
        num = num / 8;
    }

    for (i = count - 1; i >= 0; i--) {
        printf("%c", a[i]);
    }
    printf("\n");
}
%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}
