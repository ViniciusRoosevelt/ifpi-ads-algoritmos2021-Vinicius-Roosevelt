/* Leia 3 (três) números, verifique e escreva o maior entre os números lidos. */
#include <stdio.h>
#include <math.h>
int main(){
    float n1,n2,n3,maior;
    printf("Insira o primeiro numero");
    scanf("%f",&n1);
    printf("Insira o segundo numero");
    scanf("%f",&n2);
    printf("Insira o terceiro numero");
    scanf("%f",&n3);
    if(n1 > n2 && n1 > n3){
        maior = n1;
        printf("O maior número e:%f",n1);
    }else if(n2 > n1 && n1 > n3){
        maior = n2;
        printf("O maior número e:%f",n2);
    }else
        maior = n3;
        printf("O maior número e:%f",n3);
    

}