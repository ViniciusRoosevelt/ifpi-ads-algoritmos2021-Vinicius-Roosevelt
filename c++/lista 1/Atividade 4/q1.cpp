using namespace std;
#include <iostream>

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
  void set_esquerda(T valor) { this->esquerda = new ArvoreNo<T>(valor); }

  ArvoreNo<T> *pegarDireita() { return this->direita; }
  void definirDireita(T valor) {
    this->direita = new ArvoreNo<T>(valor);
    this->successor = false;
  }

  bool eSucessor() { return this->successor; }
  void definirSucessor(ArvoreNo<T> *successor) {
    this->direita = successor;
    this->successor = true;
  }
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
      this->pegarRaiz(valor);

      return;
    }

    ArvoreNo<T> *temp_no = this->pegarRaiz(), *no = NULL;

    while (temp_no != NULL) {
      no = temp_no;

      if (temp_no->pegarValor() > valor) {
        temp_no = temp_no->pegarEsquerda();
      } else if (!temp_no->eSucessor()) {
        temp_no = temp_no->pegarDireita();
      } else {
        break;
      }
    }

    if (no->pegarValor() > valor) {
      no->set_esquerda(valor);
      no->pegarEsquerda()->definirSucessor(no);
    } else if (no->eSucessor()) {
      temp_no = no->pegarDireita();

      no->definirDireita(valor);
      no->pegarDireita()->definirSucessor(temp_no);
    } else {
      no->definirDireita(valor);
    }
  }

  void mostrarPreOrdem(ArvoreNo<T> *raiz) {
    ArvoreNo<T> *no = raiz;

    while (no != NULL) {
      cout << " " << no->pegarValor();

      if (no->pegarEsquerda() != NULL) {
        no = no->pegarEsquerda();
      } else if (no->pegarDireita() != NULL) {
        if (no->eSucessor()) {
          no = no->pegarDireita()->pegarDireita();
        } else {
          no = no->pegarDireita();
        }
      }
    }
  }

  void clear() { this->pegarRaiz(NULL); }

  ArvoreNo<T> *pegarRaiz() { return this->raiz; }
  void pegarRaiz(T valor) { this->raiz = new ArvoreNo<T>(valor); }
};


int main() {
  Arvore<char> *arvore = new Arvore<char>();

  arvore->add('F');
  arvore->add('B');
  arvore->add('A');
  arvore->add('D');
  arvore->add('C');
  arvore->add('E');
  arvore->add('G');
  arvore->add('I');
  arvore->add('H');

  cout << "Pre-Order:\n\t";
  arvore->mostrarPreOrdem(arvore->pegarRaiz());

  cout << endl;

  return 0;
}