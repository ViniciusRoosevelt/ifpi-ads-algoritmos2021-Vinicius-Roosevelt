/* Leia um número e divida-o por dois (sucessivamente) até que o resultado seja menor que 1.
Escreva o resultado da última divisão efetuada. */
#include <stdio.h>
#include <iostream>
using namespace std;
int main(){
    float n1,a,b;
    printf("Insira um numero a ser divido: ");
    scanf("%f",&n1);
    do{
        n1 = n1 / 2;
    }while(n1 > 1);
    printf("A ultima divisao e %f",n1);
    
}