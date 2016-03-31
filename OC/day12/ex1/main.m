//
//  main.m
//  ex1
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    @public
    int wheels;
}
-(void)run;
-(void)test;
@end

@implementation Car
-(void)test
{
    NSLog(@"测试一下车子: %i", wheels);
}
-(void)run
{
    NSLog(@"%i个轮子的车跑起来了", wheels);
}
-(void)haha
{
    NSLog(@"调用了haha");
}
@end

int main(int argc, const char * argv[]) {
    Car *c = [Car new];
    c->wheels = 8;
    [c run];
    [c test];
    [c haha];
    
    return 0;
}
