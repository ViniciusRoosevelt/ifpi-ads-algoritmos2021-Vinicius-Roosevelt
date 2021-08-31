/* Leia 2 vetores A e B com N elementos, escreva o conjunto união entre os vetores A e B; e o
conjunto interseção entre os vetores A e B.*/
#include <iostream>
#include <locale.h>
#include <stdio.h>
int main(){
    using namespace std;
    int tamanho,tamanhob,tamanhoc,i,j,x;

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
cout << "Uniao é:[";
for(x = 0  ; x< tamanhoc; x++){
    for( j = tamanhoc ; j >=0 ; j--){
        if(c[x] == c[j]){
           cout << c[x] << ",";
            break;
        }
    }
}
cout << "]\n";
cout <<"Interseccao: [";
for(i =0 ; i < tamanho; i++){
    for(j = 0 ; j < tamanhob; j++){
        if(c[i] == c[j] ){
            cout << c[i];
        }
    }
}
cout << "]";
}

