//
//  Tire.m
//  day15
//
//  Created by xmg on 3/28/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tire.h"

@implementation Tire
@synthesize pressure;
@synthesize treadDepth;

-(NSString *) description
{
    NSString *desc;
    desc = [NSString stringWithFormat: @"Tire: Pressure: %.1f TreadDepth:%.1f", pressure, treadDepth];
    return desc;
}


-(id) initWithPressure: (float)p treadDepth:(float)td
{
    if (self = [super init]) {
        pressure = p;
        treadDepth = td;
    }
    return (self);
}
-(id) initWithTreadDepth: (float) td
{
    if (self = [self initWithPressure:34.0 treadDepth:td]) {
        NSLog(@"Specified tire treadDepth already set");
    }
    return self;
}
-(id) initWithPressure: (float) p
{
    if (self = [self initWithPressure:p treadDepth:20.0]) {
        NSLog(@"Specified tire pressure already set");
    }
    return self;
}

-(id) init
{
    if (self = [self initWithPressure:34 treadDepth:20]) {
    }
    return self;
}

-(id) copyWithZone:(NSZone *)zone
{
    Tire *tireCopy;
    tireCopy = [[[self class] allocWithZone:zone] initWithPressure:pressure treadDepth:treadDepth];
    return tireCopy;
}

@end
