/* Leia o valor do dólar e um valor em dólar, calcule e escreva o equivalente em real (valor do dolar atual R$5,25)
*/
#include <stdio.h>
#include <math.h>
int main(){
    float dolar,real;
    printf("Insira o valor a ser transformado de dolar para real:");
    scanf("%f", &dolar);
    real = (dolar * 5.25);
    printf("O valor transformado e: %0.2f", real);

}