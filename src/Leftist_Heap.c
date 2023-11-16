#include <stdio.h>
#include <stdlib.h>

typedef struct LeftistHeap {
    int size;
    int *arr;
} LeftistHeap;

LeftistHeap *createLeftistHeap(int size) {
    LeftistHeap *heap = (LeftistHeap *)malloc(sizeof(LeftistHeap));
    heap->size = -1;
    heap->arr = (int *)malloc(sizeof(int) * size);

    return heap;
}

int parent(int i) {
    return (i-1) / 2;
}

int leftChild(int i) {
    return 2 * i + 1;
}

int rightChild(int i) {
    return 2 * i + 2;
}

void swap(int *arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;

    return;
}

void shiftUp(LeftistHeap *heap, int i) {
    while(i > 0 && heap->arr[parent(i)] > heap->arr[i]) {
        swap(heap->arr, parent(i), i);
        i = parent(i);
    }

    return;
}

void shiftDown(LeftistHeap *heap, int i) {
    int MinIndex = i;
    int child;
    if(leftChild(i) > rightChild(i)) {
        child = rightChild(i);
    } else {
        child = leftChild(i);
    }
    if(child <= heap->size && heap->arr[child] < heap->arr[MinIndex]) {
        MinIndex = child;
    }
    if(MinIndex != i) {
        swap(heap->arr, MinIndex, i);
        shiftDown(heap, MinIndex);
    }

    return;
}

