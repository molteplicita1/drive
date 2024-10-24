/*
 le funzioni e strutture contenute in questo file sono state
 prese dalle slide del prof. Frattolillo o da Internet
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

void bubble_sort(int arr[], int length);
void StampaLista();
void DeleteList();
void InsertOrd(char *tkn);
void InsertHead(char *tkn);
void InsertTile(char *tkn);
void DeleteNode(char *tkn);
void IncrementaOcc(char *str);
int Ricerca(char* tkn);
int Trovato (char* tkn);

typedef struct string{

    char *str;
    unsigned long int ln;
    struct string* next;

}Nodo;

Nodo *head = NULL;

void bubble_sort(int arr[], int length){
    int swapped;
    int i = 0, j;

    do{
        swapped = 0;
        for ( j = 0; j < (length - 1 - i); j++){
            if (arr[j] > arr[j + 1]){
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                swapped = 1;
            }
        }
        i++;
    } while (swapped);
}

void StampaLista(){

    Nodo* p = head;
    while(p){
        printf("%s - %lu\n",p->str,p->ln);
        p = p->next;
    }
}

void InsertHead(char *tkn){

    Nodo* newnode = (Nodo*) malloc(sizeof(Nodo));
    newnode->str = (char*) calloc(strlen(tkn)+1,sizeof(char));
    newnode->ln  = strlen(tkn);
    strcpy(newnode->str, tkn);

    //inserimento in testa
    newnode->next = head;
    head = newnode;
}

void InsertTile(char *tkn){
    Nodo* newnode = (Nodo*) malloc(sizeof(Nodo));
    newnode->str = (char*) calloc(strlen(tkn)+1,sizeof(char));
    newnode->ln = strlen(tkn);
    strcpy(newnode->str, tkn);

    //inserimento in coda
    if( !head ){
        head = newnode;
    }
    else{
        Nodo *curr = head;
        while( curr && curr->next){
            curr = curr->next;
        }
        curr->next = newnode;
    }
}

void InsertOrd(char *tkn){

    Nodo* newnode = (Nodo*) calloc(1,sizeof(Nodo));
    newnode->str = (char*) calloc(strlen(tkn)+1,sizeof(char));
    newnode->ln = strlen(tkn);
    strcpy(newnode->str,tkn);
    newnode->next = NULL;

    if( !head ){
        head = newnode;
    }
    else{
        Nodo* curr = head;
        Nodo* prev = NULL;
        while( curr && curr->ln < strlen(tkn)){
            prev = curr;
            curr = curr->next;
        }
        if( !prev ){
            head = newnode;
            newnode->next = curr;
        }
        else{
            prev->next = newnode;
            newnode->next = curr;
        }
    }
}

void DeleteNode(char* tkn){
    if(head){
        Nodo* curr = head;
        if(strcmp(head->str,tkn) == 0){
            head = head->next;
            free(curr->str);
            free(curr);
        }
        else{
            Nodo* prev = NULL;
            while( curr && strcmp(curr->str,tkn) != 0){
                prev = curr;
                curr = curr->next;
            }
            if(curr){
                prev->next = curr->next;
                free(curr->str);
                free(curr);
            }
            else
                printf("\nelemento non trovato!\n");
        }
    }
    else
        printf("\nlista vuota!\n");
}

void IncrementaOcc(char *str){
    Nodo *curr = head;

    while(curr && strcmp(curr->string, str) == 0){
        curr = curr->next;
    }
    (curr->occ)++;
}

void DeleteList(){
    Nodo* temp = head;
    while(temp){
        temp = head->next;
        free(head);
        head = temp;
    }
}

int Ricerca(char* tkn) {    // se trovato restituisce la
    int pos = 1, trv;       // posizione
    Nodo *curr = head;

    while (curr) {
        trv = 0;
        if (strcmp(curr->str, tkn) == 0) {
            trv = 1;
            break;
        }
        curr = curr->next;
        pos++;
    }
    if (trv)
        return pos;
    else
        return -1;
}

int Trovato (char* tkn) {   // se trovato 1
    int trv;                // altrimenti 0
    Nodo *curr = head;
    while (curr) {
        trv = 0;
        if (strcmp(curr->str, tkn) == 0) {
            trv = 1;
            break;
        }
        curr = curr->next;
    }
    return trv;
}
