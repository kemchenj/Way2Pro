//
//  main.m
//  dynamicDataStructure
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    id obj = [Student new];
    if ([obj isMemberOfClass:[Student class]]) {
        [obj eat];
    }
    id obj2 = [Person new];
    [obj2 sleep];
    [obj2 test];
//    使用id动态类型的话,可以调用子类的方法
    
    NSLog(@"--------");
    return 0;
}
