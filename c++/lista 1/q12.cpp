/*  Leia 2 datas (cada data é composta por 3 variáveis inteiras: dia, mês e ano) e escreva qual delas é a mais
recente. */
#include<stdio.h>
#include<math.h>
int main(){
    int d,m,a,d1,m1,a1;
    printf("Insira o dia da primeira data: ");
    scanf("%i",&m);
    printf("Insira o mes da primeira data: ");
    scanf("%i",&a);
    printf("Insira o ano da primeira data: ");
    scanf("%i",&d);
    printf("Insira o dia da segunda data: ");
    scanf("%i",&d1);
    printf("Insira o mes da segunda data: ");
    scanf("%i",&m1);
    printf("Insira o ano da segunda data: ");
    scanf("%i",&a1);
    if(d == d1 && m == m1 && a = a1)
    printf("As datas inseridas são iguais:");
    else if(d == d1 && m == m1 && a > a1)
    printf("A primeira data é mais recentes");
    else if(d == d1 && m == m1 && a < a1)
    printf("A segunda data é mais recentes");
    else if(d < d1 && m == m1 && a == a1 )
    printf("A segunda data é mais recente");
    

}