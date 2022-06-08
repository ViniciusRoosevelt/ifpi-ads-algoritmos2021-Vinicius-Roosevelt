#include <iostream>

using namespace std;

template <class T>
class ArvoreNo
{
private:
  T valor;
  ArvoreNo<T> *esquerda, *direita;

public:
  ArvoreNo() { this->esquerda = this->direita = NULL; }

  ArvoreNo(T valor, ArvoreNo<T> *esquerda = NULL, ArvoreNo<T> *direita = NULL)
  {
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
class Arvore
{
private:
  ArvoreNo<T> *raiz;

public:
  Arvore() { this->raiz = NULL; }

  ~Arvore() { clear(); }

  void add(T valor)
  {
    if (this->pegarRaiz() == NULL)
    {
      this->definirRaiz(valor);

      return;
    }

    ArvoreNo<T> *p = this->pegarRaiz(), *prev = NULL;

    while (p != NULL)
    {
      prev = p;

      if (p->pegarValor() > valor)
      {
        p = p->pegarEsquerda();
      }
      else if (p->pegarValor() < valor)
      {
        p = p->pegarDireita();
      }
      else
      {
        return;
      }
    }

    if (valor < prev->pegarValor())
    {
      prev->definirEsquerda(valor);
    }
    else
    {
      prev->definirDireita(valor);
    }
  }


  int altura(ArvoreNo<T> *no)
  {
    int M = 0;

    this->alturaRecusiva(no, 0, &M);

    return M;
  }

  void alturaRecusiva(ArvoreNo<T> *no, int atual, int *M)
  {
    if (no == NULL)
    {
      return;
    }

    if (no->pegarEsquerda() == NULL && no->pegarDireita() == NULL)
    {
      if (atual > *M)
      {
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

int main()
{
  Arvore<int> *arvore = new Arvore<int>();

  arvore->add(5);
  arvore->add(4);
  arvore->add(30);
  arvore->add(20);
  arvore->add(10);
  int altura = arvore->altura(arvore->pegarRaiz());
  cout << altura << endl;
  cout << endl;

  return 0;
}