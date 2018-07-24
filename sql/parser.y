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
	{
	printf("\n<programa>");	
	printf("=><principal>");
	}
	principal 
	{
	printf("=><lista-de-funcoes>");
	}
	lista-de-funcoes 
	{
	printf("=><fim>");
	}
	T_FIM				
;
 
principal:
	
	T_MAIN 
	{
	printf("main");
	}
	T_ABRE_COLCHETE 
	{
	printf("[");
	}
	params
	
	T_FECHA_COLCHETE 
	{
	printf("]");
	}
	
	T_ABRE_PARENTESE
	{
	printf("(");
	}
	corpo 
	
	T_FECHA_PARENTESE
	{
	printf(")");
	}
;

lista-de-funcoes:
	{
	printf("=><lista-de-funcoes>");
	}
	funcao lista-de-funcoes2
;

lista-de-funcoes2:
	{
	printf("=><lista-de-funcoes2>");
	}
	lista-de-funcoes
	|	
;

funcao:
	id T_ABRE_COLCHETE funcao2 
;

funcao2:
	T_FECHA_COLCHETE T_ABRE_PARENTESE corpo T_FECHA_PARENTESE
	|params T_FECHA_COLCHETE T_ABRE_PARENTESE corpo T_FECHA_PARENTESE
;

params:
	{
	printf("=><params>");
	}
	id params2 
;

params2:
	{
	printf("=><params2>");
	}
	T_VIRGULA 
	{
	printf(",");
	}
	params
	|
;

corpo:
	{
	printf("=><corpo>");
	}
	id T_ABRE_COLCHETE
	{
	printf("[");
	}
	corpo2
	|T_IF T_ABRE_COLCHETE cond T_VIRGULA corpo T_VIRGULA corpo T_FECHA_COLCHETE
;

corpo2:
	T_FECHA_COLCHETE
	|args	T_FECHA_COLCHETE
;

args:
	arg args2
;

args2:
	T_VIRGULA args
	|
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
	exp T_ESPACO exp T_ESPACO exp1
	
;

exp1:
	T_MAIS
	{
	printf("+");
	}
	|T_MENOS
	{
	printf("-");
	}
;

exp:
	corpo
;

cond: 
	{
	printf("=><cond>");
	}
	exp T_ESPACO exp T_ESPACO cond1
;

cond1:
	T_MAIOR
	|T_MENOR
	|T_IGUAL
	|T_MENOR T_MAIOR
;

id:
	{
	printf("=><id>");
	}
	T_LETRA 
	{
	printf("=><seqsimb>");
	}
	seqsimb
;

num:
	{
	printf("=><num>");
	}
	T_DIGITO num2
	
;

num2:
	{
	printf("=><num2>");
	}
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
	printf("\n\nPalavra ou trecho de codigo reconhecido pela gramatica!!\n");
     }

     return 0;
}
