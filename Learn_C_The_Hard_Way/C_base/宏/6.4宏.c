#include <stdio.h>

// const double PI = 3.14159
#define PI 3.14159
// 定义了一个叫作PI的宏
// 编译预处理的时候，会把代码里所有的PI都替换成3.14159
// 单纯完全的文本替换过程
// 宏就是一个编译预处理的指令

#define FORMAT "%f\n"
#define PI2 2*PI //空格或任何标点符号都会被当作是要替换的内容

#define PRT printf("%f", PI); \
            printf("%f\n", PI2)
// 多行替换在后面要加上\去连接下面的行

int main(int argc, char const *argv[]) {
        // printf(FORMAT,  PI2*3.0);
        // printf("%f\n",  2*3.14159*3.0);
        PRT;
        return 0;
}

/* 预定义的宏
        __line__
        __file__
        __date__ 时间
 */
