/* Leia 2 (dois) números, calcule e escreva o mmc (mínimo múltiplo comum) entre os números
lidos. */
#include <iostream>
#include <stdio.h>
using namespace std;
int mmc(int n1,int n2);
int main(){
    cout << "Digite 2 numeros para saber o MMC: ";
    int n1,n2;
    cin >> n1 >> n2;
    int resp = mmc(n1,n2);
    cout << "O MMC dos numeros e: " << resp << endl;
    return 0;
}
int mmc(int n1,int n2)
{

    for(int i = 1 ; i<=(n1*n2); i++){
        if(i%n1 == 0 && i%n2 == 0){
        return i;}
    }
}