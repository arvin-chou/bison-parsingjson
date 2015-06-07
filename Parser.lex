%{
#include "Parser.h"
%}

blanks          [ \t\n]+
int             [0-9]+
identifier    [_a-zA-Z0-9]+

%%

{blanks}        { /* ignore */ }

"procedure"   return(PROCEDURE);
"{"       return(BLOCK);
"}"       return(ENDBLOCK);
":"         {return COLON;}
","         {return COMMA;}

{int}  {
    yylval.ival = atoi(yytext);
    return NUM;
}
{identifier}  {
        yylval.sval = malloc(strlen(yytext));
        strncpy(yylval.sval, yytext, strlen(yytext));
        return(IDENTIFIER);
}

