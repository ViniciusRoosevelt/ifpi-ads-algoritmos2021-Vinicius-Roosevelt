#include <stdio.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

template <class T>
class ArvoreNo {
 private:
  T Valor;
  ArvoreNo<T> *Esquerda, *Direita;

 public:
  ArvoreNo() { this->Esquerda = this->Direita = NULL; }

  ArvoreNo(T Valor, ArvoreNo<T> *Esquerda = NULL, ArvoreNo<T> *Direita = NULL) {
    this->defValor(Valor);

    this->Esquerda = Esquerda;
    this->Direita = Direita;
  }

  T pegarValor() { return this->Valor; }
  void defValor(T Valor) { this->Valor = Valor; }

  ArvoreNo<T> *pegarEsquerda() { return this->Esquerda; }
  void definirEsquerda(T Valor) { this->Esquerda = new ArvoreNo<T>(Valor); }

  ArvoreNo<T> *pegarDireita() { return this->Direita; }
  void definirDireita(T Valor) { this->Direita = new ArvoreNo<T>(Valor); }
};

template <class T>
class Arvore {
 private:
  ArvoreNo<T> *root;

 public:
  Arvore() { this->root = NULL; }


  void add(T Valor) {
    if (this->pegarRaiz() == NULL) {
      this->definirRaiz(Valor);

      return;
    }

    ArvoreNo<T> *p = this->pegarRaiz(), *prev = NULL;

    while (p != NULL) {
      prev = p;

      if (p->pegarValor() > Valor) {
        p = p->pegarEsquerda();
      } else if (p->pegarValor() < Valor) {
        p = p->pegarDireita();
      } else {
        return;
      }
    }

    if (Valor < prev->pegarValor()) {
      prev->definirEsquerda(Valor);
      cout << "no pai: " << prev->pegarValor() << endl;
      cout << "esquerda" <<endl;
    } else {
      prev->definirDireita(Valor);
      cout << "no pai: " << prev->pegarValor() << endl;
      cout << "direita" <<endl;
    }
  }
 


  ArvoreNo<T> *pegarRaiz() { return this->root; }
  void definirRaiz(T Valor) { this->root = new ArvoreNo<T>(Valor); }
}; 
 

int main() {
  Arvore<int> *arvore = new Arvore<int>();

  arvore->add(10);
  arvore->add(15);
  arvore->add(5);
  arvore->add(1);


  return 0;
}