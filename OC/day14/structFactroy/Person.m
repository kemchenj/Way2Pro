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

+(instancetype)person
{
    return [[Person alloc] init];
}

+(instancetype)personWithAge:(int)age
{
    Person *p = [[Person alloc] init];
    p.age = age;
    return p;
}

@end