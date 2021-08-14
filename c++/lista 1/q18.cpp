/* Leia o turno em que um aluno estuda, sendo M para matutino, V para Vespertino ou N para Noturno e
escreva a mensagem "Bom Dia!", "Boa Tarde!" ou "Boa Noite!" ou "Valor Inválido!", conforme o caso. */
#include<stdio.h>
#include<stdlib.h>
#include <iostream>
int main(){
    using namespace std;
    char tempo;
    printf("Insira M se voce estuda no matutino , V - para Vespertino ou N - Noturno: ");
    cin>>tempo;
    if(tempo == 'm' || tempo == 'M')
    printf("Bom dia BB!!");
    else if(tempo == 'v' || tempo == 'V')
    printf("Bom tarde BB!!");
    else if(tempo == 'N' || tempo == 'n')
    printf("Bom noite BB!!");
    else
    printf("Você inseriu uma letra errada:");

}