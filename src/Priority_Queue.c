#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Priority Queue
typedef struct _PQ {
    int size;
    int *arr;
} PQ;

// Create Priority Queue
PQ *createPQ(int size) {
    PQ *pq = (PQ *)malloc(sizeof(PQ));
    pq->size = 0;
    pq->arr = (int *)malloc(sizeof(int) * size);

    return pq;
}

// Push
void push(PQ *pq, int data) {
    int idx = pq->size + 1;

    while (idx != 1) {
        if (pq->arr[idx / 2] < data) {
            pq->arr[idx] = pq->arr[idx / 2];
            idx /= 2;
        } else {
            break;
        }
    }

    pq->arr[idx] = data;
    pq->size++;

    return;
}

// Pop
int pop(PQ *pq) {
    int ret = pq->arr[1];
    int last = pq->arr[pq->size];
    int parent = 1, child = 2;

    while (child < pq->size) {
        if(child + 1 < pq->size && pq->arr[child] < pq->arr[child + 1]) {
            child++;
        }

        if(last < pq->arr[child]) {
            pq->arr[parent] = pq->arr[child];
            parent = child;
            child *= 2;
        } else {
            break;
        }

        pq->arr[parent] = last;

        pq->size--;
        return ret;
    }
}

// Top
int top(PQ *pq) {
    return pq->arr[1];
}

// Empty
int empty(PQ *pq) {
    return pq->size == 0;
}
