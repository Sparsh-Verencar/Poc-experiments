%{
#include "Calculator.tab.h"
%}
%%
[0-9]+(\.[0-9]+)? {
    yylval.fval = atof(yytext);
    return NUMBER;
}
\+ { return PLUS; }
\- { return MINUS; }
\* { return MULTIPLY; }
\/ { return DIVIDE; }
\( { return LPAREN; }
\) { return RPAREN; }
\n { return NEWLINE; }
[ \t]+ { }
. { }
%%
int yywrap() {
    return 1;
}