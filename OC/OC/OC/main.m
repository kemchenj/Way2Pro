//
//  main.m
//  OC
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"this is a test"); // 打印一个字符串
        NSString *str = @"hello guys!";
        NSLog(@"string is: %@", str);// 使用占位符,%@表示打印一个对象,%@ OC特有的
        NSLog(@"x=%d, y=%d", 10, 20);// 使用多个占位符, %d表示int
        NSLog(@"Hello, World!");
            // @能把c语言字符串转化为OC中的字符串对象NSString
            // @符号 OC中大部分的关键字都是以@开头的,比如@interface, @implementation, @end, @class等
    }
    return 0;
}
