#include <stdio.h>

void f(int *c) {
        *c=4;
}

int main(int argc, char const *argv[]) {
        int a = 3;
        int *p;
        *p=&a;
        printf("%d\n", a);
        f(p);
        printf("%d\n", a);
}
