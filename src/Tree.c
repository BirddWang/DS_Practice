#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Node {
    char data;
    struct Node *left;
    struct Node *right;
}Node;

typedef struct Tree {
    Node *root;
}Tree;

Node *createNode() {
    Node *newNode = (Node *)malloc(sizeof(Node));
    newNode->data = 0;
    newNode->left = NULL;
    newNode->right = NULL;

    return newNode;
}

Tree *createTree() {
    Tree *newTree = (Tree*)malloc(sizeof(Tree));
    newTree->root = NULL;

    return newTree;
}

void insert(Tree *t, char data) {
    Node *newNode = createNode();
    newNode->data = data;

    if(t->root == NULL) {
        t->root = newNode;
    }
    else {
        Node *temp = t->root;
        while(temp->left != NULL && temp->right != NULL) {
            temp = temp->left;
        }
        if(temp->left == NULL) {
            temp->left = newNode;
        }
        else {
            temp->right = newNode;
        }
    }
}

Node preTraversal(Node *n) { //preorder
    printf("%d ", n->data);
    return preTraversal(n->left);
    return preTraversal(n->right);
}

Node inTraversal(Node *n) {
    return inTraversal(n->left);
    printf("%d ", n->data);
    return inTraversal(n->right);
}

Node postTraversal(Node *n) {
    return postTraversal(n->left);
    return postTraversal(n->right);
    printf("%d ", n->data);
}

int main() {
    Tree *t = createTree();
    char str[100];
    scanf("%s", str);
    for(int i=0; str[i] != '\0'; i++) {
        insert(t, str[i]);
    }
    postTraversal(t->root);
}