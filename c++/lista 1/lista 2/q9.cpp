/* Leia informações de alunos (matrícula, nota1, nota2, nota3) com o fim das informações indicado
por matrícula = 0. Para cada aluno deve ser calculada a média final de acordo com a seguinte
fórmula:
Média Final =( (2 * nota1) + (3 * nota2) + (5 * nota3) ) / 10
Se a média final for igual ou superior a 7, o aluno está aprovado; se a média final for inferior a 7,
o aluno está reprovado. Ao final devem ser mostrados o total de aprovados, o total de reprovados
e o total de alunos da turma. */
#include <stdio.h>
#include <iostream>
int main(){
    using namespace std;
    cout << "Insira a matrícula do aluno: ";
    int matricula,nota1,nota2,nota3,media,contadora,contadorm;
    contadora = 0;
    contadorm = 0;
    cin >> matricula;

    while(matricula > 0){
    cout << "Insira a primeira do nota do aluno:";
    cin >> nota1;
    cout << "Insira a segunda nota do aluno:";
    cin >> nota2;
    cout << "Insira a terceira nota do aluno:";
    cin >> nota3;
    media = ((2 * nota1) + (3*nota2) + (5*nota3) / 10);
        if(media >= 7){
            printf("Aluno da matricula %i foi aprovado",matricula);
            contadora++;
            contadorm++;
        }
        else{
            contadorm++;
        }
    cout << "\nInsira a matricula do proximo aluno: ";
    cin >> matricula;
    } 
   printf("O total de alunos = %i \n O total de aprovados = %i",contadorm,contadora);
}
