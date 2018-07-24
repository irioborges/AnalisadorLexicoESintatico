%{
#include "common.h"
#include "parser.h"
%}
 
/* Definições */
LETRA [a-z]

DIGITO [0-9]
ANY_CHAR .
FIM_LINHA [\n]

%option case-insensitive
 
%% /* Regras */
 
"MAIN" { return T_MAIN; }
"[" { return T_ABRE_COLCHETE; }
"]" { return T_FECHA_COLCHETE; }
"(" { return T_ABRE_PARENTESE; }
")" { return T_FECHA_PARENTESE; }
"" { return T_VAZIO; } 
{LETRA} { return T_LETRA; }
{DIGITO} { return T_DIGITO; }
"," { return T_VIRGULA; }
"+" { return T_MAIS; }
"-" { return T_MENOS; }
" " { return T_ESPACO; }
">" { return T_MAIOR; }
"<" { return T_MENOR; }
{FIM_LINHA} { return T_FIM; }
"=" { return T_IGUAL; }
"if" { return T_IF; }

{ANY_CHAR} {
	printf("Unexpected character in input: '%c' (ASCII=%d)\n", yytext[0], yytext[0]);
}
