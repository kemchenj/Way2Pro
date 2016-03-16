#include <stdio.h>

int main(int argc, char const *argv[]) {
        struct AAA{
                int A;
                int B;
                // long long C;
                // long long D;
                char E;
        };

        struct AAA DDD;

        printf("%ld\n", sizeof(DDD));
        printf("%ld\n", sizeof(DDD.A)+sizeof(DDD.B)+sizeof(DDD.E));
        printf("%ld\n", &DDD.B - &DDD.A);
        // printf("%ld\n", &DDD.D - &DDD.C);
        // printf("%ld\n", sizeof(DDD.C));

        return 0;
}
