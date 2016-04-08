//
//  main.c
//  数组和指针
//
//  Created by 小瓶盖 on 16/1/15.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
  
   struct person
    {
        
        char name;//1
        double  why;//8
        int what;//4
    };
    struct person one;
    printf("%lu\n",sizeof(one));
    
    struct person *onp = &one;
    
    return 0;
}
