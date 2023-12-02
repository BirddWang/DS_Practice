#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int key;
}element;

typedef struct AVLNode {
    element data;
    short int bf;
    struct AVLNode *left;
    struct AVLNode *right;
} AVLNode;

void leftRotation(AVLNode *parent, int *unbalanced) {
    AVLNode *child = parent->left;
    if(child->bf == 1) {
        /*LL*/
        parent->left = child->right;
        child->right = parent;
        child->bf = 0;
        parent->bf = 0;
    }
    else {
        /*LR*/
        AVLNode *grandChild = child->right;
        child->right = grandChild->left;
        grandChild->left = child;
        parent->left = grandChild->right;
        grandChild->right = parent;
        switch(grandChild->bf) {
            case 0:
                parent->bf = 0;
                child->bf = 0;
                break;
            case 1:
                parent->bf = -1;
                child->bf = 0;
                break;
            case -1:
                parent->bf = 0;
                child->bf = 1;
                break;
        }
        grandChild->bf = 0;
    }
    unbalanced = 0;
}
void rightRotation(AVLNode *parent, int *unbalanced) {
    AVLNode *child = parent->right;
    if(child->bf == -1) {
        /*RR*/
        parent->right = child->left;
        child->left = parent;
        child->bf = 0;
        parent->bf = 0;
    }
    else {
        /*RL*/
        AVLNode *grandChild = child->left;
        child->left = grandChild->right;
        grandChild->right = child;
        parent->right = grandChild->left;
        grandChild->left = parent;

        switch(grandChild->bf) {
            case 0:
                parent->bf = 0;
                child->bf = 0;
                break;
            case 1:
                parent->bf = 0;
                child->bf = -1;
                break;
            case -1:
                parent->bf = 1;
                child->bf = 0;
                break;
        }
        grandChild->bf = 0;
    }
    unbalanced = 0;
}

void avlInsert(AVLNode *root, element x, int *unbalanced) {
    if(!root) {
        root = (AVLNode *)malloc(sizeof(AVLNode));
        root->data = x;
        root->left = NULL;
        root->right = NULL;
        root->bf = 0;
    } 
    else if(x.key < root->data.key) {
        avlInsert(root->left, x, unbalanced);
        if(*unbalanced) {
            switch(root->bf) {
                case 1:
                    leftRotation(root, unbalanced);
                    break;
                case 0:
                    root->bf = 1;
                    break;
                case -1:
                    root->bf = 0;
                    *unbalanced = 0;
                    break;
            }
        }
    }
    else if(x.key > root->data.key) {
        avlInsert(root->right, x, unbalanced);
        if(*unbalanced) {
            switch(root->bf) {
                case 1:
                    root->bf = 0;
                    *unbalanced = 0;
                    break;
                case 0:
                    root->bf = -1;
                    break;
                case -1:
                    rightRotation(root, unbalanced);
                    break;
            }
        }
        else {
            *unbalanced = 0;
            printf("the node is already in the tree\n");
        }
    }
}

void avlDelete(AVLNode *root, element x, int *unbalanced) {
    if(!root) {
        printf("the node is not in the tree\n");
        *unbalanced = 0;
    }
    else if(x.key < root->data.key) {
        avlDelete(root->left, x, unbalanced);
        if(*unbalanced) {
            switch (root->bf)
            {
                case 1:
                    root->bf = 0;
                    *unbalanced = 0;
                    break;
                case 0:
                    root->bf = -1;
                    break;
                case -1:
                    rightRotation(root, unbalanced);
                    break;
            }
        }
    }
    else if(x.key > root->data.key) {
        avlDelete(root->right, x, unbalanced);
        if(*unbalanced) {
            switch (root->bf)
            {
                case 1:
                    leftRotation(root, unbalanced);
                    break;
                case 0:
                    root->bf = 1;
                    break;
                case -1:
                    root->bf = 0;
                    *unbalanced = 0;
                    break;
            }
        }
    }
    else {
        AVLNode *deleted = root;
        if(!root->left) {
            root = root->right;
            *unbalanced = 1;
            free(deleted);
        }
        else if(!root->right) {
            root = root->left;
            *unbalanced = 1;
            free(deleted);
        }
        else {
            AVLNode *tmp = root->left;
            while(tmp->right) tmp = tmp->right;
            root->data = tmp->data;
            avlDelete(root->left, tmp->data, unbalanced);
            if(*unbalanced) {
                switch(root->bf) {
                    case 1:
                        leftRotation(root, unbalanced);
                        break;
                    case 0:
                        root->bf = 1;
                        break;
                    case -1:
                        root->bf = 0;
                        *unbalanced = 0;
                        break;
                }
            }
        }
    }
}
