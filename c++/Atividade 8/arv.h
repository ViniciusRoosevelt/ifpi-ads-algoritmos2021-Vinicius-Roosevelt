#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <stack>

using namespace std;

template <class T>
class ArvoreNo
{
private:
    T Valor;
    ArvoreNo<T> *Esquerda, *Direita;

public:
    ArvoreNo() { this->Esquerda = this->Direita = NULL; }

    ArvoreNo(T Valor, ArvoreNo<T> *Esquerda = NULL, ArvoreNo<T> *Direita = NULL)
    {
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
class Arvore
{
private:
    ArvoreNo<T> *root;

public:
    Arvore() { this->root = NULL; }

    ~Arvore() { clear(); }

    void ins(T valor)
    {
        if (this->pegarRaiz() == NULL)
        {
            this->definirRaiz(valor);

            return;
        }

        this->ins(this->pegarRaiz(), valor);
    }

    void ins(ArvoreNo<T> *no, T valor)
    {
        if (no->pegarValor() > valor)
        {
            if (no->pegarEsquerda() == NULL)
            {
                no->definirEsquerda(valor);
            }
            else
            {
                this->ins(no->pegarEsquerda(), valor);
            }
        }
        else if (no->pegarValor() < valor)
        {
            if (no->pegarDireita() == NULL)
            {
                no->definirDireita(valor);
            }
            else
            {
                this->ins(no->pegarDireita(), valor);
            }
        }
    }
    T buscar(ArvoreNo<T> *p, T el)
    {
        while (p != 0)
        {
            if (el == p->pegarValor())
            {
                return p->pegarValor();
            }
            else if (el < p->pegarValor())
            {
                p = p->pegarEsquerda();
            }
            else
            {
                p = p->pegarDireita();
            }
        }
        return 0;
    }
    void tem(ArvoreNo<T> *no, T Valor)
    {
        if (this->buscar(no, Valor))
        {
            cout << "tem elemento" << endl;
        }
        else
        {
            cout << "não tem elemento" << endl;
        }
    }
    bool EstaCheia(ArvoreNo<T> *no)
    {
        if (no == NULL)
            return true;

        if (no->pegarEsquerda() == NULL && no->pegarEsquerda() == NULL)
            return true;

        if ((no->pegarEsquerda()) && (no->pegarEsquerda()))
            return (EstaCheia(no->pegarEsquerda()) && EstaCheia(no->pegarEsquerda()));

        return false;
    }
    void eb(ArvoreNo<T> *no)
    {
        if (EstaCheia(no))
        {
            cout << "É binaria" << endl;
        }
        else
        {
            cout << "não é binaria" << endl;
        }
    }
    void mostrarPreOrdem(ArvoreNo<T> *no)
    {
        stack<ArvoreNo<T> *> ArvorePilha;

        ArvorePilha.push(no);

        while (!ArvorePilha.empty())
        {
            cout << " " << ArvorePilha.top()->pegarValor();

            no = ArvorePilha.top();
            ArvorePilha.pop();

            if (no->pegarEsquerda() != NULL)
            {
                ArvorePilha.push(no->pegarEsquerda());
            }
            if (no->pegarDireita() != NULL)
            {
                ArvorePilha.push(no->pegarDireita());
            }
        }
    }

    void MostrarNaOrdem(ArvoreNo<T> *no)
    {
        stack<ArvoreNo<T> *> ArvorePilha;

        while (!ArvorePilha.empty() || no != NULL)
        {
            if (no != NULL)
            {
                ArvorePilha.push(no);
                no = no->pegarEsquerda();
            }
            else
            {
                cout << " " << ArvorePilha.top()->pegarValor();

                no = ArvorePilha.top();
                ArvorePilha.pop();

                no = no->pegarDireita();
            }
        }
    }

    void MostrarPosOrdem(ArvoreNo<T> *no)
    {
        stack<ArvoreNo<T> *> ArvorePilha;
        ArvoreNo<T> *last, *top;

        while (!ArvorePilha.empty() || no != NULL)
        {
            if (no != NULL)
            {
                ArvorePilha.push(no);
                no = no->pegarEsquerda();
            }
            else
            {
                top = ArvorePilha.top();

                if (top->pegarDireita() != NULL && last != top->pegarDireita())
                {
                    no = top->pegarDireita();
                }
                else
                {
                    cout << " " << top->pegarValor();

                    last = top;
                    ArvorePilha.pop();
                }
            }
        }
    }
    int nos(ArvoreNo<T> *no)
    {
        if (no == NULL)
            return (0);
        return (1 + nos(no->pegarDireita()) +
                nos(no->pegarEsquerda()));
    }

    void remove(rFusaoArvoreNo<T> *no, ArvoreNo<T> *raiz)
    {
        ArvoreNo<T> *current = raiz;

        while (current != NULL)
        {
            if (no == current)
            {
                if (no->pegarValor() > raiz->pegarValor())
                {
                    raiz->definirDireita();
                }
                else
                {
                    raiz->definirEsquerda();
                }

                delete current;

                return;
            }
            else
            {
                raiz = current;

                if (no->pegarValor() > current->pegarValor())
                {
                    current = current->pegarDireita();
                }
                else
                {
                    current = current->pegarEsquerda();
                }
            }
        }
    }
    void removerFusao(ArvoreNo<T> *no)
    {
        ArvoreNo<T> *subNoRaiz, *subNo, *noAnterior, *temp;

        if (no->pegarEsquerda() == NULL)
        {
            subNoRaiz = no->pegarDireita();
            subNo = no->pegarEsquerda();
        }
        else
        {
            subNoRaiz = no->pegarEsquerda();
            subNo = no->pegarDireita();
        }

        if (no == this->pegarRaiz())
        {
            this->definirRaiz(subNoRaiz);
        }
        else
        {
            temp = this->pegarRaiz();

            while (temp != NULL && temp != no)
            {
                noAnterior = temp;

                if (temp->pegarValor() > no->pegarValor())
                {
                    temp = temp->pegarEsquerda();
                }
                else
                {
                    temp = temp->pegarDireita();
                }
            }

            if (noAnterior->pegarValor() > subNoRaiz->pegarValor())
            {
                noAnterior->definirEsquerda(subNoRaiz);
            }
            else
            {
                noAnterior->definirDireita(subNoRaiz);
            }
        }

        while (subNoRaiz->pegarDireita() != NULL)
        {
            subNoRaiz = subNoRaiz->pegarDireita();
        }

        subNoRaiz->definirDireita(subNo);

        delete no;
    }

    void clear() { this->definirRaiz(NULL); }

    ArvoreNo<T> *pegarRaiz() { return this->root; }
    void definirRaiz(T Valor) { this->root = new ArvoreNo<T>(Valor); }
};
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <stack>

using namespace std;

template <class T>
class ArvoreNo
{
private:
    T Valor;
    ArvoreNo<T> *Esquerda, *Direita;

public:
    ArvoreNo() { this->Esquerda = this->Direita = NULL; }

    ArvoreNo(T Valor, ArvoreNo<T> *Esquerda = NULL, ArvoreNo<T> *Direita = NULL)
    {
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
class Arvore
{
private:
    ArvoreNo<T> *root;

public:
    Arvore() { this->root = NULL; }

    ~Arvore() { clear(); }

    void ins(T valor)
    {
        if (this->pegarRaiz() == NULL)
        {
            this->definirRaiz(valor);

            return;
        }

        this->ins(this->pegarRaiz(), valor);
    }

    void ins(ArvoreNo<T> *no, T valor)
    {
        if (no->pegarValor() > valor)
        {
            if (no->pegarEsquerda() == NULL)
            {
                no->definirEsquerda(valor);
            }
            else
            {
                this->ins(no->pegarEsquerda(), valor);
            }
        }
        else if (no->pegarValor() < valor)
        {
            if (no->pegarDireita() == NULL)
            {
                no->definirDireita(valor);
            }
            else
            {
                this->ins(no->pegarDireita(), valor);
            }
        }
    }
    T buscar(ArvoreNo<T> *p, T el)
    {
        while (p != 0)
        {
            if (el == p->pegarValor())
            {
                return p->pegarValor();
            }
            else if (el < p->pegarValor())
            {
                p = p->pegarEsquerda();
            }
            else
            {
                p = p->pegarDireita();
            }
        }
        return 0;
    }
    void tem(ArvoreNo<T> *no, T Valor)
    {
        if (this->buscar(no, Valor))
        {
            cout << "tem elemento" << endl;
        }
        else
        {
            cout << "não tem elemento" << endl;
        }
    }
    bool EstaCheia(ArvoreNo<T> *no)
    {
        if (no == NULL)
            return true;

        if (no->pegarEsquerda() == NULL && no->pegarEsquerda() == NULL)
            return true;

        if ((no->pegarEsquerda()) && (no->pegarEsquerda()))
            return (EstaCheia(no->pegarEsquerda()) && EstaCheia(no->pegarEsquerda()));

        return false;
    }
    void eb(ArvoreNo<T> *no)
    {
        if (EstaCheia(no))
        {
            cout << "É binaria" << endl;
        }
        else
        {
            cout << "não é binaria" << endl;
        }
    }
    void mostrarPreOrdem(ArvoreNo<T> *no)
    {
        stack<ArvoreNo<T> *> ArvorePilha;

        ArvorePilha.push(no);

        while (!ArvorePilha.empty())
        {
            cout << " " << ArvorePilha.top()->pegarValor();

            no = ArvorePilha.top();
            ArvorePilha.pop();

            if (no->pegarEsquerda() != NULL)
            {
                ArvorePilha.push(no->pegarEsquerda());
            }
            if (no->pegarDireita() != NULL)
            {
                ArvorePilha.push(no->pegarDireita());
            }
        }
    }

    void MostrarNaOrdem(ArvoreNo<T> *no)
    {
        stack<ArvoreNo<T> *> ArvorePilha;

        while (!ArvorePilha.empty() || no != NULL)
        {
            if (no != NULL)
            {
                ArvorePilha.push(no);
                no = no->pegarEsquerda();
            }
            else
            {
                cout << " " << ArvorePilha.top()->pegarValor();

                no = ArvorePilha.top();
                ArvorePilha.pop();

                no = no->pegarDireita();
            }
        }
    }

    void MostrarPosOrdem(ArvoreNo<T> *no)
    {
        stack<ArvoreNo<T> *> ArvorePilha;
        ArvoreNo<T> *last, *top;

        while (!ArvorePilha.empty() || no != NULL)
        {
            if (no != NULL)
            {
                ArvorePilha.push(no);
                no = no->pegarEsquerda();
            }
            else
            {
                top = ArvorePilha.top();

                if (top->pegarDireita() != NULL && last != top->pegarDireita())
                {
                    no = top->pegarDireita();
                }
                else
                {
                    cout << " " << top->pegarValor();

                    last = top;
                    ArvorePilha.pop();
                }
            }
        }
    }
    int nos(ArvoreNo<T> *no)
    {
        if (no == NULL)
            return (0);
        return (1 + nos(no->pegarDireita()) +
                nos(no->pegarEsquerda()));
    }

    void remove(rFusaoArvoreNo<T> *no, ArvoreNo<T> *raiz)
    {
        ArvoreNo<T> *current = raiz;

        while (current != NULL)
        {
            if (no == current)
            {
                if (no->pegarValor() > raiz->pegarValor())
                {
                    raiz->definirDireita();
                }
                else
                {
                    raiz->definirEsquerda();
                }

                delete current;

                return;
            }
            else
            {
                raiz = current;

                if (no->pegarValor() > current->pegarValor())
                {
                    current = current->pegarDireita();
                }
                else
                {
                    current = current->pegarEsquerda();
                }
            }
        }
    }
    void removerFusao(ArvoreNo<T> *no)
    {
        ArvoreNo<T> *subNoRaiz, *subNo, *noAnterior, *temp;

        if (no->pegarEsquerda() == NULL)
        {
            subNoRaiz = no->pegarDireita();
            subNo = no->pegarEsquerda();
        }
        else
        {
            subNoRaiz = no->pegarEsquerda();
            subNo = no->pegarDireita();
        }

        if (no == this->pegarRaiz())
        {
            this->definirRaiz(subNoRaiz);
        }
        else
        {
            temp = this->pegarRaiz();

            while (temp != NULL && temp != no)
            {
                noAnterior = temp;

                if (temp->pegarValor() > no->pegarValor())
                {
                    temp = temp->pegarEsquerda();
                }
                else
                {
                    temp = temp->pegarDireita();
                }
            }

            if (noAnterior->pegarValor() > subNoRaiz->pegarValor())
            {
                noAnterior->definirEsquerda(subNoRaiz);
            }
            else
            {
                noAnterior->definirDireita(subNoRaiz);
            }
        }

        while (subNoRaiz->pegarDireita() != NULL)
        {
            subNoRaiz = subNoRaiz->pegarDireita();
        }

        subNoRaiz->definirDireita(subNo);

        delete no;
    }

    void clear() { this->definirRaiz(NULL); }

    ArvoreNo<T> *pegarRaiz() { return this->root; }
    void definirRaiz(T Valor) { this->root = new ArvoreNo<T>(Valor); }
};