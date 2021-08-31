/* Leia um vetor A com N elementos e escreva um vetor B, com os mesmos elementos de A,
sendo que estes deverão estar invertidos, ou seja, o 1o elemento de A deve ser o último
elemento de B; o 2o elemento de A deve ser o penúltimo elemento de B e assim por diante. */
#include <iostream>
#include <stdio.h>
int main(){
    using namespace std;
    int tamanho,i,x;
    cout << "Insira o tamanho do vetor:";
    cin >> tamanho;
    int vetora[tamanho],vetorb[tamanho];
    for(int i = 0 ; i < tamanho; i++){
cout << "Digite os elementos da posição:" << i << "\n";
cin >> vetora[i];
 cout << "Os elementos do vetorb e[";
    }
    for(i = 0 , x = tamanho - 1 ; i < tamanho && x >= 0;i++,x--){
        vetorb[i] = vetora[x];
        cout  <<vetorb[i] << ",";
    }
    cout << "]";

}

