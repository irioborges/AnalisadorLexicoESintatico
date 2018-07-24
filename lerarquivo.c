#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv){
  FILE *fp;
  char char_caracter[1];
  int temp;

  if(argc != 2){
    printf("Quantidade de parametros informados incorreta!\n");
    return 0;
  }

  fp = fopen(argv[1], "r");

  if(fp == 0){
    printf("Erro de abertura do arquivo!\n");
    return 0;
  }

  while(feof(fp) == 0){
    char_caracter[0] = fgetc(fp);
    temp = verificaCaracterPertence(char_caracter);
    if(temp == 1){
      printf("Caracter pertence ao alfabeto!\n");
    }
  }  

  return 0;
}


int verificaCaracterPertence(char *caracter){
  
  //IFSÃO COM UM OU PARA CADA SIMBOLO DO ALFABETO
  if(strcmp(caracter, "a") == 0 || strcmp(caracter, "b") == 0 || strcmp(caracter, "c") == 0 || strcmp(caracter, "d") == 0 ||strcmp(caracter, "e") == 0 || strcmp(caracter, "f") == 0 || strcmp(caracter, "g") == 0 || strcmp(caracter, "h") == 0 || strcmp(caracter, "i") == 0 || strcmp(caracter, "j") == 0 || strcmp(caracter, "k") == 0 || strcmp(caracter, "l") == 0 || strcmp(caracter, "m") == 0 || strcmp(caracter, "n") == 0 || strcmp(caracter, "o") == 0 || strcmp(caracter, "p") == 0 || strcmp(caracter, "q") == 0 || strcmp(caracter, "r") == 0 || strcmp(caracter, "s") == 0 || strcmp(caracter, "t") == 0 || strcmp(caracter, "u") == 0 || strcmp(caracter, "v") == 0 || strcmp(caracter, "w") == 0 || strcmp(caracter, "x") == 0 || strcmp(caracter, "y") == 0 || strcmp(caracter, "z") == 0 || strcmp(caracter, "0") == 0 || strcmp(caracter, "1") == 0 || strcmp(caracter, "2") == 0 || strcmp(caracter, "3") == 0 || strcmp(caracter, "4") == 0 || strcmp(caracter, "5") == 0 || strcmp(caracter, "6") == 0 || strcmp(caracter, "7") == 0 || strcmp(caracter, "8") == 0 || strcmp(caracter, "9") == 0 || strcmp(caracter, "[") == 0 || strcmp(caracter, "]") == 0 || strcmp(caracter, "(") == 0 || strcmp(caracter, ")") == 0 || strcmp(caracter, "+") == 0 || strcmp(caracter, "-") == 0 || strcmp(caracter, "*") == 0 || strcmp(caracter, "<") == 0 || strcmp(caracter, ">") == 0 || strcmp(caracter, "=") == 0 || strcmp(caracter, ",") == 0 || strcmp(caracter, " ") == 0){
    return 1;
  }else{
    return 0;
  }
  
}


