/* Leia um vetor A com N elementos e escreva um vetor B, com os mesmos elementos de A,
sendo que estes deverão estar invertidos, ou seja, o 1o elemento de A deve ser o último
elemento de B; o 2o elemento de A deve ser o penúltimo elemento de B e assim por diante. */
#include <iostream>
#include <stdio.h>
int main(){
    using namespace std;
    int a[10];
    int b[10];
    int i = 0;
    for(i = 0 ; i < 10 ; i++){
        cout << "Informe o valor do vetor na posicao:" << i << ":";
        cin >> a[i];
     cout << i;
     }  cout << "\nO elementos de b e:";
     for(i = 9;i > 0; i-- ){
         b[i] = a[i];
         cout << "\n" << b[i];

     }
}