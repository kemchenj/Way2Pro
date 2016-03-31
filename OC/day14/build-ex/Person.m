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
    return [NSString stringWithFormat:@"age = %i", _age];
}

@end
