// Gere um vetor com os N primeiros termos da seqüência de Fibonacci (0,1,1,2,3,5,8,13,21,...).
#include <iostream>
#include <stdio.h>
int main(){
    using namespace std;
    int num,f1,f2,f3,tamanho,i;
    f1 = 0;
    f2 = 0;
    f3 = 1;
    // Insiro o tamhno do vetor:
    cout << "Insira o tamanho do vetor:";
    cin >> tamanho;
    int a[tamanho];
    cout << "O elementos do vetor e igual a: ";
    // Preencho o vetor com o resultador da soma
    for(i = 0; i < tamanho;i++){
        f1 = f2;
        f2 = f3;
        f3 = f1 + f2;
        a[i] = f3;
        cout << a[i] << ",";
    }

}