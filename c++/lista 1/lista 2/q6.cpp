// Escreva um programa para determinar o número de dígitos de um número informado.
#include <stdio.h>
#include <iostream>
int main(){
    using namespace std;
    cout << "Insira um numero de no maximo 4 digitos: ";
    int n1;
    cin >> n1;
    if(n1 > 9999){
        cout << "Voce inseriu um numero de mais de 4 digitos";
    }
    else if(n1 / 1000 <= 9 && n1 / 1000 >= 1 && n1 <= 9999){
        cout << "Voce inseriu um numero de 4 digitos";
    }
    else if(n1 / 100 <= 9 && n1/100 >= 1 && n1 <= 999){
        cout << "Voce inseriu um numero de 3 digitos";
    }
    else if(n1 / 10 <= 9 && n1/10 >= 1 && n1 <= 99){
        cout << "Voce inseriu um numero de 2 digitos";
    }
    else if(n1 / 1 <= 9 && n1 / 1 >= 1 && n1 <= 9){
        cout << "Voce inseriu um numero de 1 digito";
    }
}