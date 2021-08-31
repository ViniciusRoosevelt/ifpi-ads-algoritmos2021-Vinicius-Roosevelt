/* Leia um vetor com N elementos, encontre e escreva o maior e o menor elemento e suas
respectivas posições no vetor. */
#include <iostream>
#include <locale.h>
#include <stdio.h>
int main(){
    using namespace std;
    int tamanho,i,maior,posmaior,posmenor,menor,n;

    cout << "Insira o tamanho do vetor a ";
    cin >> tamanho;
    int a[tamanho];
    // Insiro o tamnho do vetor através dos dado do usuario:
    for(i = 0 ; i < tamanho ; i++){
        cout << "A posicao " << i << ",receberal qual elemento:";
        cin >> a[i];
    }
    maior = a[0];
    posmaior = 0;
   // Preencho o vetor com os dados do usuario e atribuo o maior elemento e sua posição:
    for(i = 1 ; i < tamanho ; i++){
        if(a[i] > maior){
            maior = a[i];
            posmaior = i;
        }
    }
    menor = a[0];
    posmenor = 0;
    // Preencho o vetor com os dados do usuario e atribuo o menor elemento e sua posição:
for(n = 0 ; n < tamanho; n++){
    if(a[n] < menor){
        menor = a[n];
        posmenor = n;
    }
}
cout << "A posicao do maior elemento e o elemento e respectivamente:" << posmaior << "," << maior;
cout << "\nA posicao do menor elemento e o elemento e respectivamente:" << posmenor << "," << menor;
}