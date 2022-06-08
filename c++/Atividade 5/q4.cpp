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
  void definirEsquerda(ArvoreNo<T> *no) { this->esquerda = no; }

  ArvoreNo<T> *pegarDireita() { return this->direita; }
  void definirDireita(T valor) { this->direita = new ArvoreNo<T>(valor); }
  void definirDireita(ArvoreNo<T> *no) { this->direita = no; }
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

  void remove(ArvoreNo<T> *no) {
    ArvoreNo<T> *subno_raiz, *subno, *noAnterior, *temp;

    if (no->pegarEsquerda() == NULL) {
      subno_raiz = no->pegarDireita();
      subno = no->pegarEsquerda();
    } else {
      subno_raiz = no->pegarEsquerda();
      subno = no->pegarDireita();
    }

    if (no == this->pegarRaiz()) {
      this->definirRaiz(subno_raiz);
    } else {
      temp = this->pegarRaiz();

      while (temp != NULL && temp != no) {
        noAnterior = temp;

        if (temp->pegarValor() > no->pegarValor()) {
          temp = temp->pegarEsquerda();
        } else {
          temp = temp->pegarDireita();
        }
      }

      if (noAnterior->pegarValor() > subno_raiz->pegarValor()) {
        noAnterior->definirEsquerda(subno_raiz);
      } else {
        noAnterior->definirDireita(subno_raiz);
      }
    }

    while (subno_raiz->pegarDireita() != NULL) {
      subno_raiz = subno_raiz->pegarDireita();
    }

    subno_raiz->definirDireita(subno);

    delete no;
  }

  void mostrar(ArvoreNo<T> *raiz) {
    cout << raiz->pegarValor() << " ";

    this->mostrarRecusiva(raiz);
  }

  void mostrarRecusiva(ArvoreNo<T> *no) {
    if (no == NULL) {
      return;
    }

    if (no->pegarEsquerda() != NULL) {
      cout << no->pegarEsquerda()->pegarValor() << " ";
    }
    if (no->pegarDireita() != NULL) {
      cout << no->pegarDireita()->pegarValor() << " ";
    }

    this->mostrarRecusiva(no->pegarEsquerda());
    this->mostrarRecusiva(no->pegarDireita());
  }

  int altura(ArvoreNo<T> *raiz) {
    int M = 0;

    this->alturaRecusiva(raiz, 0, &M);

    return M;
  }

  void alturaRecusiva(ArvoreNo<T> *no, int atual, int *M) {
    if (no == NULL) {
      return;
    }

    if (no->pegarEsquerda() == NULL && no->pegarDireita() == NULL) {
      if (atual > *M) {
        *M = atual;
      }

      return;
    }

    this->alturaRecusiva(no->pegarEsquerda(), atual + 1, M);
    this->alturaRecusiva(no->pegarDireita(), atual + 1, M);
  }

  void clear() { this->definirRaiz(NULL); }

  ArvoreNo<T> *pegarRaiz() { return this->raiz; }
  void definirRaiz(T valor) { this->raiz = new ArvoreNo<T>(valor); }
  void definirRaiz(ArvoreNo<T> *no) { this->raiz = no; }
};

int main() {
  Arvore<int> *arvore = new Arvore<int>();

  arvore->add(3);
  arvore->add(1);
  arvore->add(4);

  cout << "\nAltura: ";
  cout << arvore->altura(arvore->pegarRaiz());  

  cout << "\nAltura: ";
  cout << arvore->altura(arvore->pegarRaiz()); 

  cout << endl;

  return 0;
}