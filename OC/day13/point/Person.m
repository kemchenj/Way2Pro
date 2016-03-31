//
//  Person.m
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person

-(void)setAge:(int)age
{
    _age = age;
}

-(void)setHeight:(double)height
{
    _height = height;
}

-(void)setName:(NSString *)name
{
    _name = name;
}

-(int)age
{
    return _age;
}

-(double)height
{
    return _height;
}

-(NSString *)name
{
    return _name;
}

-(void)test
{
    NSLog(@"test");
}
@end
