#include <stdio.h>
#include <stdlib.h>

typedef struct _node{
        int value;
        struct _node* next;
} Node;

typedef struct _list{
        Node* head;
        Node* tail;
} List;

void add(List* pList, int number);

int main(int argc, char const *argv[]) {
        List list;
        int number;
        list.head = NULL;
        list.tail = NULL;
        while (number != -1){
                printf("输入number: \n");
                scanf("%d\n", &number);
                if (number != -1) {
                        add(&list, number);
                }
        }

        printf("输入完成\n");

        Node *p;
        for (p=list.head ;p; p=p->next) {
                printf("%d\n", p->value);
        }

        printf("输出完成\n");

        return 0;
}

void add(List *pList, const int number) {
        // add to linked-list
        Node* p = (Node*)malloc(sizeof(Node));
        p->value = number;
        p->next = NULL;

        // find the next
        if (pList->head && pList->tail) {
                pList->tail->next = p;
                pList->tail = pList->tail->next;
        }else if (pList->head) {
                pList->head->next = p;
                pList->tail = p;
        }else{
                pList->head = p;
                pList->tail = pList->head;
        }
}
