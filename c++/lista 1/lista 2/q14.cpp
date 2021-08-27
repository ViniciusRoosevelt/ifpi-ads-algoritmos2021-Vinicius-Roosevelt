/* Leia dois nomes e compare se os nomes são iguais. Se forem iguais imprima “São Iguais!”, senão
imprima “São Diferentes”.
OBSERVAÇÃO: Faça usando:
string nome1;
string nome2; */
#include <iostream>
using namespace std;
int main(){
    int i,p;
    string nome;
    string n;
    cout << "Insira o primeiro nome:";
    cin >> nome; // Entradas
    cout << "Insira o segundo nome:";
    cin >> n; 
    for(i = 0; i < n.size();i++){ // Percorrendo caracter por caracter usando for e armazenado as voltas de for

    }
    for(p = 0 ; p < nome.size(); p++){

    }
    if(i == p){
        cout << "Os nomes sao iguais:"; // Saída 1
    }
    else{
        cout << "Os nomes sao diferentes:"; // Saida 2
    }

}