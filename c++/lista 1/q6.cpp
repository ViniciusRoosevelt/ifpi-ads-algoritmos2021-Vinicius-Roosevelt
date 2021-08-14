/* Leia 2 (dois) números, verifique e escreva o menor e o maior entre os números lidos. */
#include <stdio.h>
#include <math.h>
int main(){
    float n1,n2,maior;
    printf("Insira o primeiro numero");
    scanf("%f",&n1);
    printf("Insira o segundo numero");
    scanf("%f",&n2);
    if(n1 > n2) {
maior = n1;
    printf("O maior e: %f",n1);
    }
    else if(n2 > n1) {
        maior = n2;
        printf("O maior e: %f",n2);
}else{
    printf("Os numeros sao iguais");
}
}