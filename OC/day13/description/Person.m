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
-(void)setWeight:(double)weight
{
    _weight = weight;
}
-(void)setName:(NSString*)name
{
    _name = name;
}
-(void)setTel:(NSString*)tel
{
    _tel = tel;
}
-(void)setEmail:(NSString *)email
{
    _email = email;
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
-(NSString *)tel
{
    return _tel;
}
-(NSString *)email
{
    return _email;
}

-(NSString *)description
{
    NSLog(@"------------");
    return [NSString stringWithFormat:@"%@", self];
}
// 使用%@打印某个对象的时候,默认会调用NSObject的description去打印
// 只要调用了这个方法,方法就会返回一个字符串,字符串的默认个事<类的名称: 对象的地址>




+ (NSString *)description
{
    return @"ooxx";
}

@end