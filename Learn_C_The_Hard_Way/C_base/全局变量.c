#include <stdio.h>

int f(void);

int gAll = 12;

int main(int argc, char const *argv[]) {
        printf("in %s gAll=%d\n", __func__, gAll);
        f();
        printf("agn in %s gAll=%d\n", __func__, gAll);
        return 0;
}

int f(void){
        printf("agn in %s gAll=%d\n", __func__, gAll);
        gAll += 2;
        printf("agn in %s gAll=%d\n", __func__, gAll);
        return gAll;
}
