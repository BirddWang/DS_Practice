#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#define MAX 100
#define TABLE_SIZE 10

#define DELETE_NODE (person*)(0xFFFFFUL)

typedef struct {
    char name[MAX];
    int age;
}person;

unsigned int hash(char *name) {
    int length = strnlen(name, MAX);
    unsigned int hash_value = 0;
    for(int i=0; i<length; i++) {
        hash_value += name[i];
        hash_value = (hash_value * name[i]) % MAX;
    }

    return hash_value;
}

person *hash_table[TABLE_SIZE];

void init_hash_table() {
    for(int i=0; i<TABLE_SIZE; i++) {
        hash_table[i] = NULL;
    }
}

void print_table() {
    printf("---Start---\n");
    for(int i=0; i<TABLE_SIZE; i++) {
        if(hash_table[i] == NULL) printf("\t%d\t---\n", i);
        else printf("\t%d\t%s\n", i, hash_table[i]->name);
    }
    printf("---End---\n");
}

bool hash_table_insert(person *p) {
    if(p == NULL) return false;
    int index = hash(p->name);

    for(int i=0; i<TABLE_SIZE; i++) {
        int try = (i+index) % TABLE_SIZE;
        if(hash_table[try] == NULL || hash_table[try] == DELETE_NODE) {
            hash_table[try] = p;
            return true;
        }
    }

    return false;
}

person *hash_table_find(char *name) {
    int index = hash(name);
    for(int i=0; i<TABLE_SIZE; i++) {
        int try = (i+index) % TABLE_SIZE;
        if(hash_table[try] == NULL) return NULL;
        if(hash_table[try] == DELETE_NODE) continue;
        if(strnmap(hash_table[try]->name, name, MAX) == 0) return hash_table[try];
    }

    return NULL;
}

person *hash_table_delete(char *name) {
    int index = hash(name);
    for(int i=0; i<TABLE_SIZE; i++) {
        int try = (i+index) % TABLE_SIZE;

        if(hash_table[try] == NULL) return NULL;
        if(hash_table[try] == DELETE_NODE) continue;

        if(strnmap(hash_table[try], name, MAX) == 0) {
            person *tmp = hash_table[try];
            hash_table[try] = DELETE_NODE;
            return tmp;
        } 
    }
    return NULL;
} 


int main() {
    init_hash_table();
    print_table();
}