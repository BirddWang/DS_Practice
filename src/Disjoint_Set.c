#include <stdio.h>
#include <stdlib.h>

typedef struct DisjointSet {
    int *parent;
    int *rank;
    int size;
} DisjointSet;

DisjointSet *createDSet(int size) {
    DisjointSet *dest = (DisjointSet *)malloc(sizeof(DisjointSet));
    dest->parent = (int *)malloc(sizeof(int) * size);
    dest->rank = (int *)malloc(sizeof(int) * size);
    int size = size;

    for(int i=0; i<size; i++) {
        dest->parent[i] = i;
        dest->rank[i] = 0;
    }
}

int find(DisjointSet *dest, int x) {
    if(dest->parent[x] == x) {
        return x;
    } else {
        return dest->parent[x] = find(dest, dest->parent[x]);
    }
}

DisjointSet *Union(DisjointSet *dest, int x, int y) {
    int _x = find(dest, x);
    int _y = find(dest, y);
    if(_x == _y) return dest;

    if(dest->rank[_x] > dest->rank[_y]) {
        dest->parent[_y] = _x;
    }
    else {
        dest->parent[_x] = _y;
        if(dest->rank[_x] == dest->rank[_y]) {
            dest->rank[_y]++;
        }
    }

    return dest;
}



