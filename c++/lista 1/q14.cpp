/* Leia uma letra e verifique se letra é "F" e escreva “F – Feminino” ou “M” e escreva “M – Masculino”,
se não for nem F ou M, escreva “Sexo Inválido”. */
#include <stdio.h>
#include <iostream>
int main(){
using namespace std;
printf("Insira M - Masculino e F - Feminino:");
char f;

cin>>f;

if(f=='F'){cout<<"voce e uma mulher"<<endl;}

else if(f=='M'){cout<<"voce e um homem"<<endl;}
else 
printf("Sexo inválido")


}