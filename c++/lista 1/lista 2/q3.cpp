/* Leia 2 (dois) números, calcule e escreva o mdc (máximo divisor comum) entre os números lidos. */
#include <stdio.h>
int main(){
    int n1,n2,a,b,resto;
    printf("Digite dois numeros para vermos o MDC: ");
    scanf("%d %d",&n1,&n2);
     a = n1;
     b = n2;
    do{
        resto = a % b;
        a = b;
        b = resto;
    }while(resto != 0);
    printf("O MDC e %d e %d = %d. \n",n1,n2,a);
}