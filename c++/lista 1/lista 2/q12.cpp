/*Leia dois nomes e compare se os nomes são iguais. Se forem iguais imprima “São Iguais!”, senão
imprima “São Diferentes”.
OBSERVAÇÃO:
Faça usando:
char nome1[20];
char nome2[20];
USE A FUNÇÃO STRCMP () PARA COMPARAR AS STRINGS. */
#include <string>
#include <iostream>
int main(){
    using namespace std;
    char nome[20];
    char name[20];
    cout << "Insira o primeiro nome:";
    cin >> nome;
    cout << "Insira o segundo nome:";
    cin >> name;
    int deposito;
    deposito = strcmp(nome,name);
    if(deposito == 0){
        cout << "Os nomes sao iguais";
    }
    else{
        cout << "Os nomes sao diferentes";
    }
   
}