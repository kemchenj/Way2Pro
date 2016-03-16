#include <stdio.h>

int main(){
        int a=0, b=0;
        while (--a<0);
        printf("int数据类型最大数是： %d\n", a);
        b++;
        while((a=a/10)!=0){
                b++;
                printf("%d\n", a);
        }
        printf("int数据类型最大数的数位： %d\n", b);
        return 0;
}
