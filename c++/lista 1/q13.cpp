/* Leia um número e mostre na tela se o número é positivo ou negativo. */
#include<stdio.h>
#include<math.h>
int main(){
    int x;
    printf("Insira o numero a verificar:");
    scanf("%i",&x);
    if(x >= 0)
    printf("O número é positivo");
    else
    printf("Número negativo: ");
}