%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char *s);
%}
%union {
    float fval;
}
%token <fval> NUMBER
%token PLUS MINUS MULTIPLY DIVIDE LPAREN RPAREN NEWLINE
%type <fval> expr
%left PLUS MINUS
%left MULTIPLY DIVIDE
%%
input:
    input line
    | line
    ;
line:
    NEWLINE
    | expr NEWLINE {
        printf("= %.2f\n", $1);
    }
    ;
expr:
    NUMBER {
        $$ = $1;
    }
    | expr PLUS expr {
        $$ = $1 + $3;
    }
    | expr MINUS expr {
        $$ = $1 - $3;
    }
    | expr MULTIPLY expr {
        $$ = $1 * $3;
    }
    | expr DIVIDE expr {
        $$ = $1 / $3;
    }
    | LPAREN expr RPAREN {
        $$ = $2;
    }
    ;
%%
void yyerror(char *s) {
    printf("Error: %s\n", s);
}
int main() {
    printf("Calculator\n");
    yyparse();
    return 0;
}