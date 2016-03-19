#include <stdio.h>

int main(int argc, char const *argv[]) {
        int c = 22;
        int* a;
        a = &c;
        *a = 10;
        printf("%d\n", *a);
        return 0;
}
