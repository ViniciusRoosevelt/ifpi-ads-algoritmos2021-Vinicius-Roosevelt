/* leia um vetor A com N elementos e escreva um vetor B com N elementos, conforme a
seguinte condição: se índice de A[índice] é par então B[índice] = 0, caso contrário B[índice]
= 1. */
#include <iostream>
#include <locale.h>
#include <stdio.h>
int main(){
    using namespace std;
    int tamanho,i,n;

    cout << "Insira o tamanho do vetor a ";
    cin >> tamanho;
    int a[tamanho];
    int b[tamanho];
 for(i = 0 ; i < tamanho;i++){
        cout << "Insira o  " << i << " elemento do vetor a:";
    cin >> a[i];
    if(i % 2 == 0){
        b[i] = 0;
    }
    else{
        b[i] = 1;
    }
    }
    cout << "Os elementos do vetor b sao [";
    for(n = 0 ; n < tamanho;n++){
cout << b[n] << ",";
    }
    cout << "]";
}