//
//  main.c
//  day08
//
//  Created by xiaomage on 15/6/12.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    /*
    int score =  99;
    int score2 = 88;
    int scores[88] = {1, 3, 5, 7};
    元素类型 数组名称[元素个数];
    */
    /*
//                    0, 1, 2, 3
    int scores[88] = {1, 3, 5, 7};
    int scores2[88] = {2, 3, 5, 7};
    int scores3[88] = {1, 9, 5, 7};
    */
    /*
     二维数组: 数组中的每一个元素又是一个数组, 那么这个数组就称之为二维数组
     元素类型 数组名称[一维数组的个数][每个一维数组的元素个数];
     元素类型 数组名称[行数][列数];
     
     元素类型: 说明二维数组中每个一维数组存储什么类型的数据
     一维数组的个数: 说明二维数组有多少个元素
     每个一维数组的元素个数 :  说明二维数组中每一个一维数组的元素个数
     */
    int scoress[3][5] =
    {
        {1, 3, 5, 7, 9}, // 0 // 每一个一维数组都是二维数组的一个元素
        {2, 4, 6, 8, 10},// 1
        {1, 2, 3, 4 , 5} // 2
    };
    
    
    char names[2][3] =
    {
//        0    1    2
        {'l', 'n', 'j'}, // 0
        {'x', 'm', 'g'} // 1
    };
    // 如何获取二维数组中的一维数组的元素的值
    printf("%c\n", names[0][0]);
    
    // 如何遍历二维数组
    // 思路: 1.取出二维数组的每一个元素(取出二维数组中的一维数组)
    //       2.遍历一维数组
    
    for (int i = 0; i < 2; i++) { // 0 , 1
        // 1.取出一维数组
//        names[i];
        for (int j = 0; j < 3; j++) { // 0 , 1 , 2
            printf("name[%i][%i] = %c\n", i, j, names[i][j]);
        }
    }
    return 0;
}
