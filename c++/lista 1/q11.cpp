/* Leia dois valores e uma das seguintes operações a serem executadas (codificadas da seguinte forma: 1 –
Adição, 2 – Subtração, 3 – Multiplicação e 4 – Divisão). Calcule e escreva o resultado dessa operação
sobre os dois valores lidos. */
#include <stdio.h>
#include <math.h>
int main(){
    int n1,n2,o,soma,subtra,multi,div;
    printf("Insira o primeiro numero: ");
    scanf("%i",&n1);
    printf("Insira o segundo numero: ");
    scanf("%i",&n2);
    printf("Selecione a operação: ");
    scanf("%i",&o);
    if(o == 1){
        soma = n1+n2;
        printf("A operação selecionada foi a soma e o resultado dela e:%i",soma);
    }else if(o == 2){
        subtra = n1-n2;
        printf("A operação selecionada foi a subtracao e o resultado dela e:%i",subtra);
    }else if(o == 3){
        multi = n1 * n2;
        printf("A operação selecionada foi a multiplicacao e o resultado dela e:%i",multi);
    }else if(o == 4){
        div = n1 / n2;
        printf("A operação selecionada foi a soma e o resultado dela e:%i",div);
    }else
    printf("Você uma operação errada");
}
