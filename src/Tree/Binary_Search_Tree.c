#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct Node {
    int data;
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
    Tree *newTree = (Tree *)malloc(sizeof(Tree));
    newTree->root = NULL;

    return newTree;
}

void insert(Tree * t, int data) {
    Node *newNode = createNode();
    newNode->data = data;
    if(t->root == NULL) {
        t->root = newNode;
        return;
    }
    Node *temp = t->root;
    while(temp->data > data && temp->left != NULL) {
        temp = temp->left;
    }
    while(temp->data < data && temp->right != NULL) {
        temp = temp->right;
    }
    if(temp->data > data) {
        temp->left = newNode;
    }
    else {
        temp->right = newNode;
    }

    return;
}

void delete(Tree *t, int data) {
    Node *tmp = t->root;
    Node *parent = NULL;
    while(tmp != NULL && tmp->data != data) {
        if(tmp->data > data) {
            parent = tmp;
            tmp = tmp->left;
        }
        else if(tmp->data < data){
            parent = tmp;
            tmp = tmp->right;
        }
        else {
            break;
        }
    }
    if(tmp == NULL || tmp->data != data) {
        return;
    }
    
    if(tmp->left == NULL && tmp->right == NULL) {
        if(parent == NULL) {
            t->root = NULL;
        }
        else if(parent->left == tmp) {
            parent->left = NULL;
        }
        else {
            parent->right = NULL;
        }
    }
    else if(tmp->left == NULL) {
        if(parent == NULL) {
            t->root = tmp->right;
        }
        else if(parent->left == tmp) {
            parent->left = tmp->right;
        }
        else {
            parent->right = tmp->right;
        }
    }
    else if(tmp->right == NULL) {
        if(parent == NULL) {
            t->root = tmp->left;
        }
        else if(parent->left == tmp) {
            parent->left = tmp->left;
        }
        else {
            parent->right = tmp->left;
        }
    }
    else {
        Node *tmp2 = tmp->right;
        Node *parent2 = tmp;
        while(tmp2->left != NULL) {
            parent2 = tmp2;
            tmp2 = tmp2->left;
        }
        tmp->data = tmp2->data;
        if(parent2->left == tmp2) {
            parent2->left = tmp2->right;
        }
        else {
            parent2->right = tmp2->right;
        }
    }

    free(tmp);

}