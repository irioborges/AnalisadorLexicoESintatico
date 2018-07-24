%{
#include "common.h"
#include <stdio.h>

int deuErro = 0;
int teste;

%}
 
%token T_LETRA
%token T_DIGITO
%token T_MAIN
%token T_ABRE_COLCHETE
%token T_FECHA_COLCHETE
%token T_ABRE_PARENTESE
%token T_FECHA_PARENTESE
%token T_IF
%token T_IGUAL
%token T_MAIOR
%token T_MENOR
%token T_MAIS
%token T_MENOS
%token T_VIRGULA
%token T_VAZIO
%token T_ESPACO
%token T_PONTO_E_VIRGULA
%token T_FIM

%error-verbose
 
%%
 
programa:
	principal lista-de-funcoes T_FIM				
;
 
principal:
	T_MAIN T_ABRE_COLCHETE params T_FECHA_COLCHETE T_ABRE_PARENTESE corpo T_FECHA_PARENTESE
;

lista-de-funcoes:
	funcao
;

lista-de-funcoes:
	funcao lista-de-funcoes
;

funcao:
	id T_ABRE_COLCHETE T_FECHA_COLCHETE T_ABRE_PARENTESE corpo T_FECHA_PARENTESE
;

funcao:
	id T_ABRE_COLCHETE params T_FECHA_COLCHETE T_ABRE_PARENTESE corpo T_FECHA_PARENTESE
;

params:
	id T_VIRGULA params
;

params:
	id
;

corpo:
	id T_ABRE_COLCHETE T_FECHA_COLCHETE
;

corpo:
	id T_ABRE_COLCHETE args T_FECHA_COLCHETE
;

corpo:
	T_IF T_ABRE_COLCHETE cond T_VIRGULA corpo T_VIRGULA corpo T_FECHA_COLCHETE
;

args:
	arg
;

args:
	arg T_VIRGULA args
;

arg:
	exp
;

arg:
	corpo
;

exp:
	num
;

exp:
	id	
;

exp:
	exp T_ESPACO exp T_ESPACO T_MAIS
;

exp:
	exp T_ESPACO exp T_ESPACO T_MENOS
;

exp:
	corpo
;

cond: 
	exp T_ESPACO exp T_ESPACO cond1
;

cond1:
	T_MAIOR
	|T_MENOR
	|T_IGUAL
	|T_MENOR T_MAIOR
;

id:
	T_LETRA seqsimb
;

num:
	T_DIGITO num2
	
;

num2:
	T_DIGITO num
	|
;

seqsimb:
	T_LETRA seqsimb
	|
;

seqsimb:
	T_DIGITO seqsimb
;

%%
 
void yyerror(const char* errmsg)
{
	deuErro = 1;
	//Print(root);
	printf("\n*** Erro: %s\n", errmsg);
}
 
int yywrap(void) { return 1; }
 
int main(int argc, char** argv)
{
     yyparse();

     if(deuErro == 0){
	printf("\nPalavra ou trecho de codigo reconhecido pela gramatica!!\n");
     }

     return 0;
}
