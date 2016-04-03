//
//  Engine.m
//  day15
//
//  Created by xmg on 3/28/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Engine.h"

@implementation Engine

-(NSString *) description
{
    return [NSString stringWithFormat:@"I am a Engine. My Power is %d.", power];
}

-(id)copyWithZone:(NSZone *)zone
{
    Engine *engineCopy;
    engineCopy = (Engine *) [[[self class] allocWithZone:zone] init];
    engineCopy->power = power;
    // alloc是一个类方法
    // 之所以用的是self而不是Engine,是因为还要考虑它的子类
    
    return engineCopy;
}

-(id) init
{
    if (self = [super init]) {
        power = 145;
    }
    return self;
}

@end