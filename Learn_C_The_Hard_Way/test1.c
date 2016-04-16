#include <stdio.h>

int main(int argc, char const *argv[]) {
    for (size_t i = 1; i <= 100; i++) {
        int count = 0;
        for (size_t j = 2; j<i; j++) {
            if (i%j==0) {
                count++;
                break;
            }
        }
        if (!count) {
            printf("%zu是素数\n", i);
        }
    }
    return 0;
}
