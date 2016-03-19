#include <stdio.h>

#define cube(x) (x)*(x)*(x)
// 可以定义像是函数的宏
#define RADTODEG1(x) (x * 57.29578)
#define RADTODEG2(x) (x) * 57.29578

int main(int argc, char const *argv[]) {
        printf("%d\n", cube(3));
        // cube（3）会被替换成3*3*3

        int i=6;
        printf("%d\n", cube(i));
        // cube（i）会被替换成i*i*i

        printf("%f\n", RADTODEG1(5+2));
        // 输出119.591560
        printf("%f\n", 180/RADTODEG2(1));
        // 输出10303.240400
        // 因为宏是单纯的文本替换，而不是函数计算
        // 所以宏里的变量全部都要用括号
        // 一切都要括号
        return 0;
}
