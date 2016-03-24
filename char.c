#include <stdio.h>

int getNum(char a[], int length){ //数组长度在外面判断完再传进来
        char temp[31] = {'0'};
        // 用来保存数字
        for (size_t i = 0; i < length; i++) {
                // ASCII的48为字符‘0’，57为‘9’
                // 检测到字符为数字的话就开始复制到temp里
                if (a[i] >= 48 && a[i] <= 58) {
                        int j = 0;
                        // 当后面的字符为数值时，就逐个保存到temp里
                        // 不为数字时，就不再录入
                        while (a[i] >= 48 && a[i] <= 57) {
                                temp[j] = a[i];
                                j++;
                                i++;
                        }
                        break;
                        // 退出外层循环，不再录入第二个出现的数字
                }
        }

        int result = atoi(temp);
        // 用atoi把字符串转化为数字
        // 要注意这里传的是字符串的指针

        return result;
}
