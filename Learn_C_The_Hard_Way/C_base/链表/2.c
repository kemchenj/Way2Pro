// 入股直接封装的话，会因为函数调用的是副本而没办法修改head，智能用指针
// add操作的head是复制过去的副本，而不是head本身
// 并且封装好add能够提高复用性
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
                        head = add(head, number);
                        // 这样的add使用方法很受限
                        // 所以最好是传head的指针进去，那么就能够降低add的使用难度
                        // 具体请看3.c
                }
        }while(number != -1);

        return 0;
}

void add(Node *head, int number) {
        // add to linked-list
        Node *p = (Node*)malloc(sizeof(Node));
        p->value = number;
        p->next = NULL;
        // find the last
        Node *last = head;
        if (last) {
                while ( last->next) {
                        last = last->next;
                }
                // attach
                last->next = p;
        }else{
                head = p;
        }

        return head;
}
