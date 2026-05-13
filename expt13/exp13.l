%{
#include<stdio.h>
#include<stdlib.h>
float num1 = 0, num2 = 0;
char op;
int count = 0;
%}
%%
[0-9]+(\.[0-9]+)? {
    if(count == 0) {
        num1 = atof(yytext);
        count++;
    } else {
        num2 = atof(yytext);
        
        switch(op) {
            case '+':
                printf("%.2f %c %.2f = %.2f\n", num1, op, num2, num1 + num2);
                break;
            case '-':
                printf("%.2f %c %.2f = %.2f\n", num1, op, num2, num1 - num2);
                break;
            case '*':
                printf("%.2f %c %.2f = %.2f\n", num1, op, num2, num1 * num2);
                break;
            case '/':
                if(num2 == 0)
                    printf("Error: Division by zero\n");
                else
                    printf("%.2f %c %.2f = %.2f\n", num1, op, num2, num1 / num2);
                break;
        }
        count = 0;
    }
}
[+\-*/] {
    op = yytext[0];
}
[ \t\n]+ { /* ignore whitespace */ }

. { printf("Invalid input: %s\n", yytext); }
%%
int yywrap() {
    return 1;
}
int main() {
    printf("Simple Calculator (Lex only)\n");
    printf("Enter: number operator number (e.g., 5 + 3)\n");
    yylex();
    return 0;
}