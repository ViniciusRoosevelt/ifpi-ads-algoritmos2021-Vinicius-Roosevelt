/* Leia um
numero X e, a seguir, leia e escreva uma lista de números com o término da lista
ocorrendo quando a soma de dois números consecutivos da lista for igual a X. */
#include <stdio.h>
#include <iostream>
int main(){
    using namespace std;
    cout << "Insira um numero: ";
    int n1;
    cin >> n1;
    for(int i = 0 ; 1 + i <= n1; i++){
    int soma = 1+i;
    printf("%d + 1 = %d\n",i,soma);
    }
}