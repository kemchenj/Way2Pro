#include <stdio.h>
#include <stddef.h>

int main(int argc, char const *argv[]) {
    struct Example{
        int a;
        char b;
    };

    int size_example = sizeof(struct Example);
    int offset_b = offsetof(struct Example, b);

    printf("size_example = %d\n", size_example);
    printf("offset_b = %d\n", offset_b);

    return 0;
}
