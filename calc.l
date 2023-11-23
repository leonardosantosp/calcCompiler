%{
#include <stdlib.h>
#include "tree.c"
#define YYSTYPE ptno
#include "calc.h"
void yyerror (char *);
%}

%%
[0-9]+ 	{ yylval = criaNo ('n',atoi(yytext)); return NUM; }
[a-z] 	{ yylval = criaNo ('v', *yytext-'a'); return VAR; }
"="		return ATRIB;
"+" 	return MAIS;
"-"		return MENOS;
"*"		return VEZES;
"/"	return DIV;
"(" 	return ABRE;
")"		return FECHA;
\n		return ENTER;
[ \t]+ /* saltar espacos e tabulacoes */
.	yyerror("caracter invalido");
%%

int yywrap(void) {
	return 1;
}
