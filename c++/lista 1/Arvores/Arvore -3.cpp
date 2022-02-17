#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace std;
struct item
{
    int cod;
};

typedef struct item Item;

struct node
{
    Item item;
    struct node *left;
    struct node *right;
};

typedef struct node Node;

Node *treeInitialize()
{
    return NULL;
}

Item itemCreate(int cod)
{
    Item item;
    item.cod = cod;
    return item;
}
Node *treeInsert(Node *root, Item x)
{
    if (root == NULL)
    {
        Node *aux = (Node *)malloc(sizeof(Node));
        aux->item = x;
        aux->left == NULL;
        aux->right == NULL;
        return aux;
    }
    else
    {
        if (x.cod > root->item.cod)
        {
            root->right = treeInsert(root->right, x);
        }
        else if (x.cod < root->item.cod)
        {
            root->left = treeInsert(root->left, x);
        }
    }
    return root;
}

void treePrint(Node *root)
{
    if (root != NULL)
    {
        cout << root->item.cod;
        treePrint(root->left);
        treePrint(root->right);
    }
}
void treeFree(Node *root)
{
    if (root != NULL)
    {
        treeFree(root->left);
        treeFree(root->right);
        free(root);
    }
}

int main()
{
    Node *root = treeInitialize();
    root = treeInsert(root, itemCreate(10));
    root = treeInsert(root, itemCreate(15));
    root = treeInsert(root, itemCreate(20));
    root = treeInsert(root, itemCreate(12));
    root = treeInsert(root, itemCreate(5));
    treePrint(root);

    printf("\n");
    treeFree(root);
    return 0;
}