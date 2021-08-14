/* Leia o preço de três produtos e informe qual produto deve ser comprado, sabendo que a decisão é
sempre pelo mais barato. */
#include <stdio.h>
#include <math.h>
int main(){
    int a,b,c;
    printf("Insira o primeiro valor do produto1: "); // Entrada 1
    scanf("%i",&a); 
    printf("Insira o segundo valor do produto2: "); // Entrda 2
    scanf("%i",&b);
    printf("Insira o terceiro valor do produto3: "); // Entrada 3
    scanf("%i",&c);
    if(a < b && a < c) 
    printf("O menor preco e:%i",a); // Saída 1
    else if(b < a && b < c) // Saída 2
    printf("O menor preco e:%i",b);
    else if(c < a && c < b) // Saída 3
    printf("O menor preco e:%i",c);
    else 
    printf("Voce inseriu valores errados que não são diferentes");
}