#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int key;
    int value;
}element;

typedef struct {
    element data;
    int degree;
    int marked;
    Node *left;
    Node *right;
    Node *parent;
    Node *child;
}Node;

typedef struct {
    Node *min;
}fheap;

element createElement(int key, int value) {
    element newElement;
    newElement.key = key;
    newElement.value = value;
    return newElement;
}

Node *createNode(element data) {
    Node *newNode = (Node *)malloc(sizeof(Node));
    newNode->data = data;
    newNode->marked = 0;
    newNode->degree = 0;
    newNode->left = newNode; //自指
    newNode->right = newNode;
    newNode->parent = NULL;
    newNode->child = NULL;

    return newNode;
}

fheap *createFHeap() {
    fheap *newheap = (fheap *)malloc(sizeof(fheap));
    newheap->min = NULL;
    return newheap;
}

void insert(fheap *h, element data) {
    Node *newNode = createNode(data);
    if(h->min == NULL) {
        h->min = newNode;
    }
    else {
        newNode->left = h->min;
        newNode->right = h->min->right;
        h->min->right = newNode;
        newNode->right->left = newNode;
    }
    if(newNode->data.key < h->min->data.key) {
        h->min = newNode;
    }
}

void link(Node *y, Node *x) {
    // remove y from root list of heap
    y->left->right = y->right;
    y->right->left = y->left;
    // make y a child of x
    if(x->child == NULL) {
        x->child = y;
        y->right = y;
        y->left = y;
    }
    else {
        y->left = x->child;
        y->right = x->child->right;
        x->child->right = y;
        y->right->left = y;
    }
    x->degree++;
    y->marked = 0;
    y->parent = x;
}

void consolidate(fheap *h) {
    int i, d, D;
    Node *x, *y, *w, *tmp;
    Node *A[100];
    for(i = 0; i < 100; i++) {
        A[i] = NULL;
    }
    x = h->min;
    w = x;
    do {
        w = w->right;
        d = x->degree;
        while(A[d] != NULL) {
            y = A[d];
            if(x->data.key > y->data.key) {
                tmp = x;
                x = y;
                y = tmp;
            }
            if(y == h->min) {
                h->min = x;
            }
            link(y, x);
            if(x->right == x) {
                h->min = x;
            }
            A[d] = NULL;
            d++;
        }
        A[d] = x;
        x = x->right;
    } while(x != h->min);
    h->min = NULL;
    for(i=0; i<100; i++) {
        if(A[i] != NULL) {
            if(h->min == NULL) {
                h->min = A[i];
            }
            else {
                if(A[i]->data.key < h->min->data.key) {
                    h->min = A[i];
                }
            }
        }
    }
}

element extractMin(fheap *h) {
    Node *minNode = h->min;
    if(minNode == NULL) return;

    Node *child = NULL;
    //put minNode's child into root list
    if(minNode->child != NULL) {
        child = minNode->child;
        do {
            Node *m = child->right;
            //Remove child from heap
            child->right->left = child->left;
            child->left->right = child->right;
            child->parent = NULL;
            //Add child to root list of heap
            child->right = h->min->right;
            child->left = h->min;
            h->min->right = child;
            child->right->left = child;
            child = m;
        } while(child != minNode->child);
    }
    //remove minNode from root list of heap
    minNode->left->right = minNode->right;
    minNode->right->left = minNode->left;
    if(minNode == minNode->right) {
        h->min = NULL;
    }
    else {
        h->min = minNode->right;
        concolidate(h);
    }
    return minNode->data;
}

void cut(fheap *h, Node *x, Node *y) {
    //remove x from child list of y and decrement degree[y]
    if(x == x->right) {
        y->child == NULL;
    }
    else {
        x->left->right = x->right;
        x->right->left = x->left;
        if(x == y->child) {
            y->child = x->right;
        }
    }
    y->degree--;
    //add x to root list of heap
    x->right = h->min->right;
    x->left = h->min;
    h->min->right = x;
    x->right->left = x;
    x->parent = NULL;
    x->marked = 0;
}

void cascadingCut(fheap *h, Node *y) {
    Node *z = y->parent;
    if(z != NULL) {
        if(y->marked == 0) {
            y->marked = 1;
        }
        else {
            cut(h, y, z);
            cascadingCut(h, z);
        }
    }
}

void decreaseKey(fheap *h, Node *x, element k) {
    if(k.value > x->data.value) {
        return;
    }
    x->data = k;
    Node *y = x->parent;
    cut(h, x, y);
    cascadingCut(h, y);
    if(x->data.key < h->min->data.key) {
        h->min = x;
    }
}

Node *find(fheap *h, element data) {
    Node *x = h->min;
    if(x == NULL) return NULL;
    do {
        if(x->data.key == data.key && x->data.value == data.value) {
            return x;
        }
        else {
            Node *y = NULL;
            if((y = find(x->child, data)) != NULL) {
                return y;
            }
        }
    } while((x = x->right) != h->min);
    return NULL;
}

void delete(fheap *h, element data) {
    Node *x = find(h, data);
    element m;
    m.key = -10000;
    decreaseKey(h, x, m);
    extractMin(h);
}

void quite() {
    exit(0);
}


int main() {
    char *command;
    
    fheap *h = createFHeap();

    while(1) {
        char *order;
        element data;
        scanf("%s", command);
        order = strtok(command, " ");
        if(order == "insert") {
            char* key = strtok(NULL, " ");
            int i_key = atoi(key);
            char* value = strtok(NULL, " ");
            int i_value = atoi(value);
            data = createElement(i_key, i_value);
            insert(h, data);
        }
        else if(order == "extract") {
            extractMin(h);
        }
        else if(order == "delete") {
            char* key = strtok(NULL, " ");
            int i_key = atoi(key);
            char* value = strtok(NULL, " ");
            int i_value = atoi(value);
            data = createElement(i_key, i_value);
            delete(h, data);
        }
        else if(order == "decrease") {
            char* key = strtok(NULL, " ");
            int i_key = atoi(key);
            char* value = strtok(NULL, " ");
            int i_value = atoi(value);
            char *decreaseValue = strtok(NULL, " ");
            int i_decreaseValue = atoi(decreaseValue);
            data = createElement(i_key, i_value);
            Node *x = find(h, data);
            element k = createElement(x->data.key, i_decreaseValue);
            decreaseKey(h, x, k);
        }
        else {
            exit(0);
        }

    }
}