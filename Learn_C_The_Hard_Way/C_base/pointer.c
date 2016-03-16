#include <stdio.h>

void MyFun1(int x);
void MyFun2(int x);
void MyFun3(int x);

typedef void (*FunType)(int );
//②. 定义一个函数指针类型FunType,与①函数类型一致
void CallMyFun(FunType fp, int x);

int main(int argc, char *argv[]) {
        CallMyFun(MyFun1, 10);
        //⑤. 通过CallMyFun函数分别调用三个不同的函数
        CallMyFun(MyFun2, 20);
        CallMyFun(MyFun3, 30);
        return 0;
}

//③. 参数fp的类型是FunType。
void CallMyFun(FunType fp,int x) {
        fp(x);
        //④. 通过fp的指针执行传递进来的 函数，注意fp所指的函数是有一个参数的
}

//①. 这是个有一个参数 的函数，以下两个函数也相同
void MyFun1(int x) {
        printf("MyFun1 output: %d\n", x);
}

void MyFun2(int x) {
        printf("MyFun2 output: %d\n", x);
}

void MyFun3(int x) {
        printf("MyFun3 output: %d\n", x);
}
