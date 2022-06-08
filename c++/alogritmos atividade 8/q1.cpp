void inorder()
    {
        ArvoreNo<T> *prev, *p = pegarRaiz();
        if (p != 0)
        {
            while (p != 0)
                p = p->pegarEsquerda();
            while (p != 0)
            {
                visit(p);
                prev = p;
                p = p->pegarDireita();
                if (p != 0 && prev->successor == 0)
                    while (p->pegarEsquerda() != 0)
                        p = p->pegarEsquerda();
            }
        }
    }
    void Posrdem(ArvoreNo<T> *raiz)
    {
        while (raiz)
        {
            if (raiz->pegarEsquerda() == NULL)
            {
                cout << raiz->pegarValor() << " ";
                raiz = raiz->pegarDireita();
            }
            else
            {
                node *current = raiz->pegarEsquerda();
                while (current->pegarDireita() && current->pegarDireita() != raiz)
                    current = current->pegarDireita();

                if (current->pegarDireita() == raiz)
                {
                    current->pegarDireita() = NULL;
                    raiz = raiz->pegarDireita();
                }

                else
                {
                    cout << raiz->pegarValor() << " ";
                    current->pegarDireita() = raiz;
                    raiz = raiz->pegarEsquerda();
                }
            }
        }
    }
  void MorrisInorder()
    {
        ArvoreNo<T> *p = this->pegarRaiz(), *tmp;
        while (p != 0)
            if (p->pegarEsquerda() == 0)
            {
                visit(p);
                p = p->pegarDireita();
            }
            else
            {
                tmp = p->pegarEsquerda();
                while (tmp->pegarDireita() != 0 && 
                       tmp->pegarDireita() != p
                    tmp = tmp->pegarDireita();   
                if (tmp->pegarDireita() == 0)
                {
                    tmp->pegarDireita() = p;
                    p = p->pegarEsquerda(); 
                }                            
                else
                {
                    visit(p);
                    tmp->pegarDireita() = 0;
                    p = p->pegarDireita(); 
                }
            }
    }
  
