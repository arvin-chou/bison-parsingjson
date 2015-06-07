%{
#include <stdio.h>
%}

// Symbols.
%union
{
  char  *sval;
  int    ival;
};
%token <ival> NUM
%token <sval> IDENTIFIER
%token PROCEDURE
%token BLOCK
%token ENDBLOCK
%token COLON COMMA

%start START_BLOCK
%%

START_BLOCK:
  OBJECT
  ;

Pairs:
  /* empty */
  | Pairs COMMA Pair
  | Pair
  ;

Pair:
  IDENTIFIER COLON VALUE { printf("\t\tPair Key: %s\n", $1); }
  ;

OBJECT:
  BLOCK Pairs ENDBLOCK
  | BLOCK ENDBLOCK
  ;

VALUE:
  IDENTIFIER { printf("\t\tvalue: %s\n", $1); }
  | NUM { printf("\t\tvalue: %d\n", $1); }
  | OBJECT
  ;

%%

int yyerror(char *s) {
  printf("yyerror : %s\n",s);
}

int main(void) {
  yyparse();
}
