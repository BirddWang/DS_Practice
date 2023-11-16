#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAX 100
#define TABLE_SIZE 10
#define DELETE_NODE = (person *)(0xFFFFFUL)

typedef struct person {
    char name[MAX];
    int age;
    struct person *next;
} person;

person *hash_table[TABLE_SIZE];

unsigned int hash(char *name) {
    int length = strnlen(name, MAX);
    unsigned int hash_value = 0;
    for(int i=0; i<length; i++) {
        hash_value += name[i];
        hash_value = (hash_value * name[i]) % TABLE_SIZE;
    }
    
    return hash_value;
}

void init_hash_table() {
    for(int i=0; i<TABLE_SIZE; i++) {
        hash_table[i] = NULL;
    }
}

void print_hash_table() {
    printf("Start\n");
    for(int i=0; i<TABLE_SIZE; i++) {
        if(hash_table[i] == NULL) {
            printf("\t%i\t---\n", i);
        } else {
            printf("\t%i\t", i);
            person *temp = hash_table[i];
            while(temp != NULL) {
                printf("%s - ", temp->name);
                temp = temp->next;
            }
            printf("\n");
        }
    }
    printf("End\n");
}

bool hash_table_insert(person *p) {
    int index = hash(p->name);

    person *new_person = malloc(sizeof(person));
    strcpy(new_person->name, p->name);
    new_person->age = p->age;
    new_person->next = hash_table[index];
    hash_table[index] = new_person;
    return true;
}

person *hash_table_find(char *name) {
    int index = hash(name);
    person *tmp = hash_table[index];
    while(tmp != NULL && strncmp(tmp->name, name, MAX) != 0) {
        tmp = tmp->next;
    }
    return tmp;
}

person *hash_table_delete(char *name) {
    int index = hash(name);
    person *tmp = hash_table[index];
    person *prev = NULL;
    while(tmp != NULL && strncmp(tmp->name, name, MAX) != 0) {
        prev = tmp;
        tmp = tmp->next;
    }
    if(tmp == NULL) return NULL;
    if(prev == NULL) hash_table[index] -> next;
    else {
        prev->next = tmp->next;
    }

    return tmp;
}

