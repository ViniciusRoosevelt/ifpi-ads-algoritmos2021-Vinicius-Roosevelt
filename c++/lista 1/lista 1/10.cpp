/* Leia duas notas de um aluno e escreva na tela a palavra “Aprovado” se a média das duas notas for maior
ou igual a 7,0. Caso a média seja inferior a 7,0, escreva “O Aluno deve fazer a prova final!” e o
programa deve ler a nota da prova final e calcule a média final. Se a média final for maior ou igual a
6,0, o programa deve escrever “Aprovado!”, caso contrário deve escrever “Reprovado!”. */
#include <stdio.h>
#include <math.h>
int main (){
    int n1,n2,media,n3,media2;
    printf("Insira a primeira nota:");
    scanf("%i",&n1);
    printf("Insira a segunda nota:");
    scanf("%i",&n2);
    media = (n1 + n2) / 2;
    if(media >= 7)
    printf("Você foi aprovado com media:%i",media);
    else{
        printf("Você ficou de prova final insira sua nota final: ");
        scanf("%i",&n3);
        media2 = (media + n3)/ 2;
        if(media2 >= 7)
        printf("Você foi aprovado com a media %i",media2);
        else
        printf("Você foi reprovado com a media %i",media2);

    }

}