/*  Leia dois números X e N. A seguir, escreva o resultado das divisões de X por N onde, após
cada divisão, X passa a ter como conteúdo o resultado da divisão anterior e N é decrementado
de 1 em 1, até chegar a 2. */
#include <stdio.h>
int main(){
    float n,x,div;
    printf("Insira o valor de x: ");
    scanf("%f",&x);
    printf("Insira o valor de n: ");
    scanf("%f",&n);
while(n > 2){
    div = x / n;
    printf("%f / %f\n = %f ",x,n,div);
    x = div;
    n--;
    
}

}