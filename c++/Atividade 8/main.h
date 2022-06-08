#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <stack>
#include "arvore.h"
using namespace std;

int main()
{
    Arvore<int> *arvore = new Arvore<int>();

    arvore->ins(2);
    arvore->ins(1);
    arvore->ins(4);
    arvore->ins(5);
    arvore->ins(3);
    arvore->ins(10);
    arvore->tem(arvore->pegarRaiz(), 22);
    arvore->nos(arvore->pegarRaiz());
    arvore->eb(arvore->pegarRaiz());
    arvore->mostrarPreOrdem(arvore->pegarRaiz());
    arvore->MostrarPosOrdem(arvore->pegarRaiz());
    arvore->MostrarNaOrdem(arvore->pegarRaiz());
    arvore->remove(arvore->pegarRaiz()->pegarEsquerda()->pegarEsquerda(), arvore->pegarRaiz());
arvore->removerFusao(arvore->pegarRaiz());
    return 0;
}