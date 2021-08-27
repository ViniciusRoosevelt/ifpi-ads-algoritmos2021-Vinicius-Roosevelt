/* Leia o salário de funcionários de uma empresa, calcule e escreva o novo salário (segundo os
critérios descritos abaixo), a soma dos salários atuais, a soma dos salários reajustados e a
diferença entre as 2 somas. (Flag: salário=0) */
#include <stdio.h>
#include <iostream>
int main(){
    using namespace std;
    cout << "Insira o salário do seu funcionario: ";
    float salario,a; 
    cin >> salario;
    while(salario > 0){
        if(salario > 0 && salario <= 2999.99){
        a = 1.25 * salario;
        printf("A soma %0.2f.\n E a diferenca %0.2f",salario+a,salario-a);

    }
    else if(salario >= 3000  && salario <= 5999.99){
        a = 1.20 * salario;
        printf("A soma %0.2f.\n E a diferenca %0.2f",salario+a,salario-a);

    }
    else if(salario >= 6000 && salario <= 9999.99){
        a = 1.15 * salario;
        printf("A soma %0.2f.\n E a diferenca %0.2f",salario+a,salario-a);

    }
    else if(salario >= 10000){
        a = 1.25 * salario;
        printf("A soma %0.2f.\n E a diferenca %0.2f",salario+a,salario-a);

    } printf("\n Insira o salario do proximo trabalhador: ");
    cin >> salario;
    }
    
}