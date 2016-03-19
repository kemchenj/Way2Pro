#include <stdio.h>

#define print_int(n) printf("n = %d\n", n)
#define print_int2(n) printf(#n "= %d\n", n)
// #会字符串化内容，先替换，后字符化

#define MK_ID(n) i##n
// ##会把i跟n粘连在一起

int main(int argc, char const *argv[]) {
        print_int(8/4);
        print_int2(8/4);
        int MK_ID(1), MK_ID(2), MK_ID(3);
        return 0;
}
