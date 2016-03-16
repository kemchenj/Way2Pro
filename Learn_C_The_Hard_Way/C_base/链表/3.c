// 通过传入head的指针的指针进去
// 可以直接操作数据
// 并且降低add的使用难度
#include <stdio.h>
#include <stdlib.h>

typedef struct _node{
        int value;
        struct _node *next;
} Node;

int main(int argc, char const *argv[]) {
        Node *head = NULL;
        int number;
        do {
                scanf("%d", &number);
                if (number != -1) {
                        add(&head, number);
                }
        }while(number != -1);

        return 0;
}

void add(Node **pHead, int number) {
        // add to linked-list
        Node *p = (Node*)malloc(sizeof(Node));
        p->value = number;
        p->next = NULL;
        // find the last
        Node *last = *pHead;
        if (last) {
                while ( last->next) {
                        last = last->next;
                }
                // attach
                last->next = p;
        }else{
                *pHead = p;
        }
}
