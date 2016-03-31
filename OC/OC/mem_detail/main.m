//
//  main.m
//  mem_detail
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    int _age;
    double _height;
    double _weight;
}
-(void)eat:(NSString*)food;
-(void)sleep;
-(void)walk;
+(void)demo;
@end

@implementation Person
-(void)eat:(NSString *)food
{
    NSLog(@"吃%@", food);
}

-(void)sleep
{
    NSLog(@"开始睡觉");
}

-(void)walk
{
    NSLog(@"开始遛弯");
}

+(void)demo
{
    NSLog(@"demo");
}

@end

int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    p->_age = 30;
    p->_height = 1.75;
    p->_weight = 65.0;
    
    NSLog(@"age = %i\nheight = %f\nweight=%f", p->_age, p->_height, p->_weight);
    
    Person *p2 = [Person new];
    p2->_age = 50;
    p2->_height = 188;
    p2->_weight = 100;
    [p2 sleep];
    [p2 eat: @"屎"];
    [p2 walk];
    [Person demo];
    
    return 0;
}
