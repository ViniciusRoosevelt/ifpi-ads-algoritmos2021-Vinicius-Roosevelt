/*  Leia uma data (dia, mês e ano), verifique e escreva se a data é ou não válida. */
#include<stdio.h>
#include<stdlib.h>
#include <iostream>
#include <math.h>
int main(){
    int dia,ano,mes;
    printf("Insira um dia: ");
    scanf("%i",&dia); // Entrada 1
    printf("Insira um Mes:");
    scanf("%i",&mes); // Entrada 2
    printf("Insira um ano: ");
    scanf("%i",&dia); // Entrada 3
    if(dia <= 31 && ano <= 2021 && mes <= 12 && dia >= 1 && mes >= 1)
    printf("Você inseriu uma data correta");
    else
     printf("Você inseriu uma data errada: ");
}

