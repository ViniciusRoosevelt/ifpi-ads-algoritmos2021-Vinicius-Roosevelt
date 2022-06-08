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
  void definirEsquerda() { this->esquerda = NULL; }
  void definirEsquerda(T valor) { this->esquerda = new ArvoreNo<T>(valor); }

  ArvoreNo<T> *pegarDireita() { return this->direita; }
  void definirDireita() { this->direita = NULL; }
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

  void remove(ArvoreNo<T> *no, ArvoreNo<T> *raiz) {
    ArvoreNo<T> *current = raiz;

    while (current != NULL) {
      if (no == current) {
        if (no->pegarValor() > raiz->pegarValor()) {
          raiz->definirDireita();
        } else {
          raiz->definirEsquerda();
        }

        delete current;

        return;
      } else {
        raiz = current;

        if (no->pegarValor() > current->pegarValor()) {
          current = current->pegarDireita();
        } else {
          current = current->pegarEsquerda();
        }
      }
    }
  }

  void mostrar(ArvoreNo<T> *no) {
    if (no == NULL) {
      return;
    }

    cout << no->pegarValor() << " ";
    this->mostrar(no->pegarEsquerda());
    this->mostrar(no->pegarDireita());
  }

  void clear() { this->definirRaiz(NULL); }

  ArvoreNo<T> *pegarRaiz() { return this->raiz; }
  void definirRaiz(T valor) { this->raiz = new ArvoreNo<T>(valor); }
};

int main() {
  Arvore<int> *arvore = new Arvore<int>();

  arvore->add(15);
  arvore->add(10);
  arvore->add(5);
  arvore->add(4);
  arvore->add(7);
  arvore->add(30);
  arvore->add(20);
  arvore->add(40);

  cout << "Antes: ";
  arvore->mostrar(arvore->pegarRaiz()); 

  arvore->remove(arvore->pegarRaiz()->pegarEsquerda()->pegarEsquerda(), arvore->pegarRaiz());

  cout << "\nADepois: ";
  arvore->mostrar(arvore->pegarRaiz()); 

  cout << endl;

  return 0;