#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <stack>
#include <chrono>
#include <bits/stdc++.h>
#include <sys/time.h>
#include <thread>
#include <iostream>

using namespace std;

template <class T>
class ArvoreNo {
 private:
  T valor;
  ArvoreNo<T> *esquerda, *direita;
  bool successor;

 public:
  ArvoreNo() {
    this->esquerda = NULL;
    this->direita = NULL;

    this->successor = false;
  }

  ArvoreNo(T v, ArvoreNo<T> *l = NULL, ArvoreNo<T> *r = NULL, bool s = false) {
    this->definirValor(v);

    this->esquerda = l;
    this->direita = r;

    this->successor = s;
  }

  T pegarValor() { return this->valor; }
  void definirValor(T valor) { this->valor = valor; }

  ArvoreNo<T> *pegarEsquerda() { return this->esquerda; }
  void definirEsquerda(T valor) { this->esquerda = new ArvoreNo<T>(valor); }

  ArvoreNo<T> *pegarDireita() { return this->direita; }
  void definirDireita(T valor) {
    this->direita = new ArvoreNo<T>(valor);
    this->successor = false;
  }

  bool is_successor() { return this->successor; }
  void set_successor(ArvoreNo<T> *successor) {
    this->direita = successor;
    this->successor = true;
  }
};

template <class T>
class Arvore {
 private:
  ArvoreNo<T> *root;

 public:
  Arvore() { this->root = NULL; }

  ~Arvore() { clear(); }

  void add(T valor) {
    if (this->pegarRaiz() == NULL) {
      this->definirRaiz(valor);

      return;
    }

    ArvoreNo<T> *temp_no = this->pegarRaiz(), *no = NULL;

    while (temp_no != NULL) {
      no = temp_no;

      if (temp_no->pegarValor() > valor) {
        temp_no = temp_no->pegarEsquerda();
      } else if (!temp_no->is_successor()) {
        temp_no = temp_no->pegarDireita();
      } else {
        break;
      }
    }

    if (no->pegarValor() > valor) {
      no->definirEsquerda(valor);
      no->pegarEsquerda()->set_successor(no);
    } else if (no->is_successor()) {
      temp_no = no->pegarDireita();

      no->definirDireita(valor);
      no->pegarDireita()->set_successor(temp_no);
    } else {
      no->definirDireita(valor);
    }
  }

  void monstrarPreOrdem(ArvoreNo<T> *root) {
    ArvoreNo<T> *no = root;

    while (no != NULL) {
      cout << " " << no->pegarValor();

      if (no->pegarEsquerda() != NULL) {
        no = no->pegarEsquerda();
      } else if (no->pegarDireita() != NULL) {
        if (no->is_successor()) {
          no = no->pegarDireita()->pegarDireita();
        } else {
          no = no->pegarDireita();
        }
      }
    }
  }

  void clear() { this->definirRaiz(NULL); }

  ArvoreNo<T> *pegarRaiz() { return this->root; }
  void definirRaiz(T valor) { this->root = new ArvoreNo<T>(valor); }
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
    
      cout << "Tempo de compilaçãoAlinhada : " << fixed
          << time_taken << setprecision(9);
      cout << " sec" << endl;

  return 0;
}