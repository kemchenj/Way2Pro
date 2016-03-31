//
//  main.m
//  point
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    
    p.name = @"cmk";
    p.age = 30;
    p.height = 1.75;
    // 点在左边会自动转化为set,在右边会自动转化为get
    // 编译器
    
    NSLog(@"age = %i, name=%@, height = %f", p.age, p.name, p.height);
    p.test;
    return 0;
}
