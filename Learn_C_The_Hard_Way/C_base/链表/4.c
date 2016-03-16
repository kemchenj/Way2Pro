// 通过定义结构体list，方便以后进行内容扩充
// 例如，可以添加tail进去，当我往后面加东西的时候，不必再重新遍历一遍
// add做了一定修改
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

        return 0;
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
