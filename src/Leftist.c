#include <stdio.h>;
#include <stdlib.h>;
#include <string.h>;

typedef struct Node {
    int data;
    int s_value;
    struct Node *left;
    struct Node *right;
}Node;

typedef struct Leftist {
    Node *root;
}Leftist;

Node *createNode() {
    Node *node = (Node *)malloc(sizeof(Node));
    node->data = 0;
    node->s_value = 0;
    node->left = NULL;
    node->right = NULL;
    return node;
}

Leftist *createLeftist() {
    Leftist *leftist = (Leftist *)malloc(sizeof(Leftist));
    leftist->root = NULL;
    return leftist;
}

void swap(Node *n1, Node *n2) {
    Node *temp = n1;
    n1 = n2;
    n2 = temp;
}


//merge (or meld)
Node *merge(Node *n1, Node *n2) {
    if(n1 == NULL) return n2;
    if(n2 == NULL) return n1;

    if(n1->data > n2->data) return merge(n2, n1);

    n1->right = merge(n1->right, n2);

    if(n1->left == NULL) {
        swap(n1->left, n1->right);
        n1->s_value = 1;
    }
    if(n1->right->s_value > n2->left->s_value) {
        swap(n1->right, n1->left);
    }
    n1->s_value = n1->right->s_value + 1;

    return n1;
}

//Insert
void insert(Leftist *l, int data) {
    Node *node = createNode();
    node->data = data;
    l->root = merge(l->root, node);
}

//deleteMin
int deleteMin(Leftist *l) {
    if(l->root == NULL) return -1;
    int data = l->root->data;

    Node *temp = l->root;
    l->root = merge(l->root->left, l->root->right);

    free(temp);
    return data;
}