//
//  main.m
//  local variable
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
-(void)test;
+(void)demo;
@end

@implementation Person
-(void)test
{
    NSLog(@"test");
}
+(void)demo
{
    NSLog(@"demo");
}
@end

extern void sum();
static void minus();
extern void sum()
{
    printf("sum");
}
static void minus()
{
    printf("minus");
}

int main(int argc, const char * argv[]) {
    sum();
    Person *p = [Person new];
    [p test];
    return 0;
}
