/* Leia 1 (um) número de 2 (dois) dígitos, verifique e escreva se o algarismo da dezena é igual ou diferente
do algarismo da unidade. */
#include <stdio.h>
#include <math.h>
int main(){
    float x;
    printf("Insira o número a verificar seus algorismos: ");
    scanf("%f",&x);
    if(x == 11 || x == 22 || x == 33 || x == 44 || x == 55 || x == 66 || x == 77 || x == 88 || x == 99)
    printf("Os Algorismos são iguais");
    else
    printf("os algorismos são diferentes:");
}