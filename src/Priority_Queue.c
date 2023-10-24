#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Heap {
    int *arr;
    int size;
} Heap; 

Heap *creatHeap(int size) {
    Heap *heap = (Heap *)malloc(sizeof(Heap));
    heap->arr = (int *)malloc(sizeof(int) * size);
    heap->size = -1;

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

void shiftUp(Heap *heap, int i) {
    while(i > 0 && heap->arr[parent(i)] > heap->arr[i]) {
        int temp = heap->arr[parent(i)];
        heap->arr[parent(i)] = heap->arr[i];
        heap->arr[i] = temp;
        i = parent(i);
    }

    return;
}

void shiftDown(Heap *heap, int i) {
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
        int temp = heap->arr[MinIndex];
        heap->arr[MinIndex] = heap->arr[i];
        heap->arr[i] = temp;
        shiftDown(heap, MinIndex);
    }

    return;
}

void insert(Heap *heap, int data) {
    heap->size++;
    heap->arr[heap->size] = data;
    shiftUp(heap, heap->size);
}

int Poll(Heap *heap) {
    int result = heap->arr[0];
    heap->arr[0] = heap->arr[heap->size];
    heap->size--;
    shiftDown(heap, 0);

    return result;
}

void remove(Heap *heap, int data) {
    int i;
    for(i = 0; i <= heap->size; i++) {
        if(heap->arr[i] == data) {
            break;
        }
    }

    heap->arr[i] = heap->arr[heap->size];
    heap->size--;
    
    shiftDown(heap, i);
    shiftUp(heap, i);

    return;
}
