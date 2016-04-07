//
//  main.m
//  Block的注意点
//
//  Created by 小瓶盖 on 15/11/7.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

void(^calculateTriangularNumber)(int) =
^(int n){
    int i,triangularNumer = 0;
    
    for(i = 1;i <= n;++i){
        triangularNumer += i;
        }
        NSLog(@"Triangular number %i is %i",n,triangularNumer);
    };


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        calculateTriangularNumber(10);
        calculateTriangularNumber(20);
        calculateTriangularNumber(50);
    */
        
        
        int foo = 10;
//        如果在定义变量时在变量类型钱加上"__block 变量类型 变量名"(双下划线加block)这时候的此变量定义在block外部,就可以被允许在block内部进行访问,修改,赋值.但是依然不被允许在block外部进行修改赋值.
        
       __block int num = 20;
        
        num = 30;//虽然系统没有报错,也没有警告,但是确无法实质性的给num赋值.
        void (^printFoo)(void) = ^(void){
            
//            在Block中不能对Block外定义的变量进行修改,赋值,但是可以访问block外的变量.
//            foo = 12;
//            在block内部定义的变量在block内部既可以访问,也可赋值.但是作用域只有在block内,不能被block外访问和赋值.
            
            int goo = 100;
            goo = 111;
            
            
            num = 222;
            NSLog(@"foo = %i,goo = %i",foo,goo);
             NSLog(@"num = %i",num);
        
        };
//        goo = 112;
        foo = 15;
        
        num = 400;
        printFoo();
        
    }
    return 0;
}
