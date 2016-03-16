#include <stdio.h>
#include <stdlib.h>

typedef struct _node{
        int value;
        struct _node *next;
} Node;

typedef struct _list{
        Node* head;
        Node* tail;
} List;

void add(List* pList, int number);

int main(int argc, char const *argv[]) {
        List list;
        int number;
        list.head = list.tail = NULL;
        do {
                scanf("%d", &number);
                if (number != -1) {
                        add(&list, number);
                }
        }while(number != -1);

        // delete the whole linked-list
        for(p=head; p; p=q){
                // let p=q to refresh p
                q = p->next;
                free(p);
        }
        return 0;
}

void add(List* pList, int number) {
        Node *p = (Node*)malloc(sizeof(Node));
        p->value = number;
        p->next = NULL;

        if (pList->tail) {
                pList->tail->next = p;
                pList->tail = pList->tail->next;
        }else if(pList->head){
                pList->tail = p;
                pList->head->next = pList->tail;
        }else{
                pList->head = p;
        }
}
