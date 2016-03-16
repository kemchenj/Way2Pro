#include <stdio.h>

int f(void);

int gAll = 12;

int main(int argc, char const *argv[]) {
        f();
        f();
        f();
        return 0;
}

int f(void){
        int k=0;
        static int all = 1;
        printf("&gAll=%p\n", &gAll);
        printf("&all =%p\n", &all);
        printf("&k   =%p\n", &k);
        // 可以看到两个全局变量考得很近，实际上static是一个特殊的全局变量
        // 静态本地变量具有全局变量的生存期，而作用域只在局部
        return all;
}
