/* Leia dois nomes e compare se os nomes são iguais. Se forem iguais imprima “São Iguais!”, senão
imprima “São Diferentes”.
OBSERVAÇÃO:
Faça usando:
char nome1[20];
char nome2[20];
UTILIZE O COMANDO DE REPETIÇÃO “FOR” PARA PERCORRER AS
STRINGS CARACTERE A CARACTERE E FAZER A COMPARAÇÃO ENTRE
ELAS. */
#include <string>
#include <stdio.h>
#include <iostream>
#include <cstring>
using namespace std;
int main(){
    int deposito,dep,i,p;
    deposito = 0;
    dep = 0;
    char nome[20];
    char n[20];
    cout << "Insira o primeiro nome:";
    cin >> nome;
    cout << "Insira o segundo nome:";
    cin >> n;
    for(i = 0 ; i < n[i] ; i++){
 int deposito = i;
    }
    for(p = 0 ; p < nome[p] ; p++){
        int dep = p;
    }
    if(i != p){
        cout << "Os nomes sao diferentes!";
    }
    else{
        cout << "Os nomes sao iguais!";
    }
}