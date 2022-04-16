#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <stack>
#include <chrono>
#include <bits/stdc++.h>
#include <sys/time.h>
#include <thread>
using namespace std;
#include <iostream>

using namespace std;

template <class T>
class ArvoreNo {
 private:
  T valor;
  ArvoreNo<T> *esquerda, *direita;

 public:
  ArvoreNo() { this->esquerda = this->direita = NULL; }

  ArvoreNo(T valor, ArvoreNo<T> *esquerda = NULL, ArvoreNo<T> *direita = NULL) {
    this->definirValor(valor);

    this->esquerda = esquerda;
    this->direita = direita;
  }

  T pegarValor() { return this->valor; }
  void definirValor(T valor) { this->valor = valor; }

  ArvoreNo<T> *pegarEsquerda() { return this->esquerda; }
  void definirEsquerda(T valor) { this->esquerda = new ArvoreNo<T>(valor); }

  ArvoreNo<T> *pegarDireita() { return this->direita; }
  void definirDireita(T valor) { this->direita = new ArvoreNo<T>(valor); }
};

template <class T>
class Arvore {
 private:
  ArvoreNo<T> *raiz;

 public:
  Arvore() { this->raiz = NULL; }

  ~Arvore() { clear(); }

  void add(T valor) {
    if (this->pegarRaiz() == NULL) {
      this->definirRaiz(valor);

      return;
    }

    ArvoreNo<T> *p = this->pegarRaiz(), *prev = NULL;

    while (p != NULL) {
      prev = p;

      if (p->pegarValor() > valor) {
        p = p->pegarEsquerda();
      } else if (p->pegarValor() < valor) {
        p = p->pegarDireita();
      } else {
        return;
      }
    }

    if (valor < prev->pegarValor()) {
      prev->definirEsquerda(valor);
    } else {
      prev->definirDireita(valor);
    }
  }

  void monstrarPreOrdem(ArvoreNo<T> *node) {
    if (node == NULL) {
      return;
    }

    cout << node->pegarValor() << " ";
    this->monstrarPreOrdem(node->pegarEsquerda());
    this->monstrarPreOrdem(node->pegarDireita());
  }

  void clear() { this->definirRaiz(NULL); }

  ArvoreNo<T> *pegarRaiz() { return this->raiz; }
  void definirRaiz(T valor) { this->raiz = new ArvoreNo<T>(valor); }
};

int main() {
  Arvore<char> *arvore = new Arvore<char>();
 
    struct timespec start, end;

    ios_base::sync_with_stdio(false);
  clock_gettime(CLOCK_MONOTONIC, &start);

  arvore->add('F');
  arvore->add('B');
  arvore->add('A');
  arvore->add('D');
  arvore->add('C');
  arvore->add('E');
  arvore->add('G');
  arvore->add('I');
  arvore->add('H');


    cout << "\nPreOrder:\n\t";
    arvore->monstrarPreOrdem(arvore->pegarRaiz());



   clock_gettime(CLOCK_MONOTONIC, &end);
    double time_taken;
    time_taken = (end.tv_sec - start.tv_sec) * 1e9;
    time_taken = (time_taken + (end.tv_nsec - start.tv_nsec)) * 1e-9;
    
      cout << "Tempo de compilaçãoRecursao : " << fixed
          << time_taken << setprecision(9);
      cout << " sec" << endl;

  return 0;
}