/*  Leia uma lista de números e que para cada número lido, escreva o próprio número e a relação
de seus divisores. (flag número = 0). */
#include <iostream>
#include <stdio.h>
#include <string>
using namespace std;
int main(){
    int numero,lista;
lista = 1;
    cout << "Insira o numero a ser lido:";
    cin >> numero;
    while(numero > 0){
    for(int i = 1 ; i < numero ;i++){
        if(numero % i == 0){
       lista = i;
       printf("\nLista de divisores %i",lista);
        }
        }
        cout << "\nInsira outro numero:";
        cin >> numero;
        }
    }


    