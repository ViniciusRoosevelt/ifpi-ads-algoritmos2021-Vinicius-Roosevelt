/* Emita o resultado de uma pesquisa de opinião pública a respeito das eleições presidenciais. O
entrevistado deverá escolher entre 3 candidatos (Serra=45, Dilma=13 ou Ciro Gomes=23), ou
então responder: indeciso=99, outros=98, nulo/branco=0. O programa deve ler a opinião de voto
de cada entrevistado, encerrando-se a pesquisa com a opinião sendo igual a –1. Ao final, devem
ser mostrados:
a porcentagem de cada candidato;
a porcentagem dos outros candidatos;
a porcentagem de eleitores indecisos;
a porcentagem de votos nulos/brancos;
o total de entrevistados;
uma mensagem indicando a possibilidade ou não de haver 2o turno. */ 
#include <stdio.h>
#include <iostream>
using namespace std;
int main(){
    int opiniao,contadorvotos;
    float contadorindecisos,contadornulosbrancos,contadoroutros,serra,dilma,ciro;
    contadorvotos = 0;
    contadorindecisos = 0;
    contadornulosbrancos = 0;
    contadoroutros = 0;
    serra = 0;
    dilma = 0;
    ciro = 0;
    cout << "Insira 45 para Serra,13 para Dilma,23 para Ciro: ";
    cin >> opiniao;
    while(opiniao != -1){
        if(opiniao == 99){
            contadorvotos++;
            contadorindecisos++;
        }
        else if(opiniao == 98){
            contadorvotos++;
            contadoroutros++;
        }
        else if(opiniao == 0){
            contadorvotos++;
            contadornulosbrancos++;

        }
        else if(opiniao == 13){
        dilma++;
        contadorvotos++;
        }
        else if(opiniao == 45){
            contadorvotos++;
            serra++;
    }
    else if(opiniao == 23){
        ciro++;
        contadorvotos++;
    }
    else{
        printf("Voce inseriu dados errados tente novamente: ");
    }
    printf("\nInsira outra opiniao:");
    cin >> opiniao;
}
int total,se1,cir1,dil1;
total = contadorvotos;
serra = (serra / total) * 100;
dilma = (dilma / total) * 100;
ciro = (ciro / total) * 100;
contadoroutros = (contadoroutros / total) * 100;
contadorindecisos = (contadorindecisos / total) * 100;
contadornulosbrancos = (contadornulosbrancos / total) * 100;

printf("Total de Votos:%i%",contadorvotos);
printf("\nOutros Candidatos:%f%",contadoroutros);
printf("\nCirro:%f%",ciro);
printf("\nDilma:%f%",dilma);
printf("\nSerra:%f%",serra);
printf("\nIndecisos:%f%",contadorindecisos);
printf("\nNulos/Brancos:%f%",contadornulosbrancos);
if(ciro < 50 || serra < 50 || ciro < 50 || contadoroutros < 50){
cout << "\nSera necessario segundo turno";
}
}