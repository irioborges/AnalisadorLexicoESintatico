%{
#include "parser.h"
}%



LETRA [a-z]
DIGITO [0-9]

%%

{LETRA} {return "T_LETRA";}
{DIGITO} {return "T_DIGITO";}

%%





int main(){


  yywrap();
  yylex();
  return 0;
}


