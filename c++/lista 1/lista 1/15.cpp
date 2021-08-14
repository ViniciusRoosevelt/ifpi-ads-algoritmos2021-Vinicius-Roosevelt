/* Leia uma letra e verifique se a letra digitada é vogal ou consoante. */
#include<stdio.h>
#include<stdlib.h>
#include <iostream>
int main(){
    using namespace std;
    char letra;
    printf("Insira uma letra: ");
    cin>>letra;
    if((letra == 'a') || (letra == 'e') || (letra == 'i') || (letra == 'o') || (letra = 'u'))
    printf("Sua letra e uma vogal");
    else
    printf("Sua letra é uma consoante");
}