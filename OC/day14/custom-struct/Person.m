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

-(instancetype)init
{
    if (self = [super init]) {
        _age = 10;
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"age = %i, name = %@", _age, _name];
}

-(instancetype)initWithAge:(int)age
{
    if (self = [super init]) {
        _age = age;
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
        _name = name;
    }
    return self;
}
                
-(instancetype)initWithAge:(int)age andName:(NSString *)name
{
    if(self = [super init]){
        _age = age;
        _name = name;
    }
    return self;
}

@end