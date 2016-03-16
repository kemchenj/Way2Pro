#include <stdio.h>

int main(int argc, char const *argv[]) {
        int a = 1;
        int d = 1 || 7 && ++a;
        printf("int d = 1 || 7 && ++a;\na: %d\td: %d\n", a, d);
        printf("\n");

        a = 1;
        d = 1 || (7 && ++a);
        printf("int d = 1 || (7 && ++a);\na: %d\td: %d\n", a, d);
        printf("\n");

        a = 1;
        d = (1 || 7) && ++a;
        printf("int d = (1 || 7) && ++a;\na: %d\td: %d\n", a, d);
        printf("\n");
        
        return 0;
}
