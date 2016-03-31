//
//  Person.m
//  day14
//
//  Created by xmg on 3/22/16.
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

-(void)setWeight:(double)weight
{
    _weight = weight;
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

-(double)weight
{
    return _weight;
}

-(NSString *)name
{
    return _name;
}
@end