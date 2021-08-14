/* Leia um valor em horas e um valor em minutos, calcule e escreva o equivalente em minutos. */
#include <stdio.h>
#include <math.h>
int main(){
    float h,m,transf,soma;
    printf("Insira o valor em horas:");
    scanf("%f", &h);
    printf("Insira o valor em minutos:");
    scanf("%f", &m);
    soma = ((h * 60) + m);
    printf("A soma das horas com os minutos e igual a\n%0.0f",soma);
}