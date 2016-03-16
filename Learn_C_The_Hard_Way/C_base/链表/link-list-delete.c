#include <stdio.h>
#include <stdlib.h>

typedef struct _node{
        int value;
        struct _node *next;
} Node;
// def type Node of List

typedef struct _list{
        Node* head;
        Node* tail;
} List;

void add(List* pList, int number);
void print(List *pList);
void search(List *pList);

int main(int argc, char const *argv[]) {
        List list;
        int number;
        list.head = list.tail = NULL;
        // 初始化head跟tail，避免野指针
        do {
                scanf("%d", &number);
                if (number != -1) {
                        add(&list, number);
                }
        }while(number != -1);

        print(&list);
        search(&list);

        return 0;
}

void delete(number) {
        int number=0;
        scanf("%d", &number);

        int isFound = 0;
        if (!isFound) {
                printf("没找到\n");
        }

        Node *p;
        for ( p=pList->head; p; p=p->next) {
                if (p->value == number) {
                        printf("找到了\n");
                        isFound=1;
                        break;
                }
        }
        // the same as search

        // set a variable to store the node before p
        Node *q;
        for ( q=NULL, p=pList->head; p; q=p, p=p->next) { //p's existance proved here
                if (p->value == number) {
                        if(q){
                                q->next = p->next;
                                // if q exist, then let q point to the next one of p
                                // then p would not be one of the linked-list
                                // you could remove it safely
                        }else{
                                pList->head = p->next;
                                // if q don't exist, then head would be the only one node of linked-list
                                // then p->next must be pointing to NULL
                        }
                        printf("Deleted\n");
                        free(p);
                        break;
                }
        }
}

void search(List *pList) {
        int number=0;
        scanf("%d", &number);
        // input number as Node value

        int isFound = 0;
        if (!isFound) {
                printf("没找到\n");
        }

        Node *p;
        for ( p=pList->head; p; p=p->next) {
                if (p->value == number) {
                        printf("找到了\n");
                        isFound=1;
                        break;
                }
        }
}

void print(List *pList) {
        Node *p;
        for (p=pList->head; p; p=p->next) {
                printf("%d\n", p->value);
        }
        printf("\n");
}

void add(List* pList, int number) {
        // add to linked-list
        Node *p = (Node*)malloc(sizeof(Node));
        p->value = number;
        p->next = NULL;

        // 如果有tail的话，就用tail去指向就可以了
        // 如果没有tail，就用head去指，再把指向的node赋值给tail
        if (pList->tail) {
                pList->tail->next = p;
                pList->tail = pList->tail->next;
                // 先把p赋值给tail的next，然后再让tail成为next
        }else if(pList->head){
                pList->tail = p;
                pList->head->next = pList->tail;
                // 把p赋值给tail，然后再让head指向tail
        }else{
                pList->head = p;
        }
}
