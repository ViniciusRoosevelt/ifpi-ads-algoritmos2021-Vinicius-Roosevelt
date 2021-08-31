/* Leia 2 vetores A e B com N elementos, escreva um vetor C, sendo este a junção das vetores
A e B. Desta forma, a vetor C deverá ter 2*N elementos. */
#include <iostream>
#include <locale.h>
int main(){
    using namespace std;
    int tamanho,tamanhob,tamanhoc,i,j;

    cout << "Insira o tamanho do vetor a ";
    cin >> tamanho;
    int a[tamanho];
    cout << "Insira o tamanho do vetor b ";
    cin >> tamanhob;
    int b[tamanhob];
    tamanhoc = tamanho + tamanhob;
    int c[tamanhoc];
for(i = 0 ; i < tamanho;i++){
    cout << "Insira o  " << i << " elemento do vetor a:";
    cin >> a[i];
    c[i] = a[i];
}
for(j = 0; j < tamanhob;j++){
    cout << "Insira o  " << j << " elemento do vetor b:";
    cin >> b[j];
    c[i] = b[j];
    i++;
}
cout << "Os elementos do vetor c e[";
for(int n = 0; n < tamanhoc;n++){
    cout << c[n];
    cout << ",";
}
cout << "]";
}