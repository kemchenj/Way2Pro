//
//  Car.m
//  day15
//
//  Created by xmg on 3/27/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@implementation Tire

-(NSString *) description{
    NSString *desc;
    desc = [NSString stringWithFormat: @"Tire: Pressure: %.1f TreadDepth:%.1f", pressure, treadDepth];
    return desc;
}


-(id) init
{
    if (self = [self initWithPressure:34 treadDepth:20]) {
    }
    return self;
}
-(id) initWithPressure:(float)p treadDepth:(float)td
{
    if (self = [super init]) {
        pressure = p;
        treadDepth = td;
    }
    return (self);
}
-(id) initWithPressure: (float) p
{
    if (self = [self initWithPressure:p treadDepth:20.0]) {
        NSLog(@"Specified tire pressure already set");
    }
    return self;
}
-(id) initWithTreadDepth: (float) td
{
    if (self = [self initWithPressure:34.0 treadDepth:td]) {
        NSLog(@"Specified tire treadDepth already set");
    }
    return self;
}


-(void) setPressure: (float) p
{
    pressure = p;
}

-(float) pressure
{
    return pressure;
}

-(void) setTreadDepth: (float) td
{
    treadDepth = td;
}

-(float) treadDepth
{
    return treadDepth;
}

@end


@implementation Engine

-(NSString *) description
{
    return (@"I am an engine. Vrooom!");
}

@end


@implementation Car
-(id) init
{
    tires = [[NSMutableArray alloc] init];
    for (int i=0; i<4; i++) {
        [tires addObject:[NSNull null]];
        // 初始化每一个tire, 避免野指针
    }
    return (self);
}


-(Engine *) engine
{
    return (engine);
}
-(void) setEngine: (Engine *)newEngine
{
    engine = newEngine;
}


-(Tire *) tireAtIndex: (int) index
{
//    if (index < 0 || index >3) {
//        NSLog(@"bad index (%d) in setTire: atIndex:", index);
//        exit(1);
//    }
//    return (tires[index]);
    
//    Tire *tire;
//    tire = [tires objectAtIndex: index];
//    return (tire);
    
    return [tires objectAtIndex: index];
    // 省略了中转变量,但代码可读性会下降
    // objectAtIndex是数组的一个对象方法
}
-(void) setTire: (Tire *) tire atIndex: (int) index
{
    [tires replaceObjectAtIndex:index withObject:tire];
}


-(void) print
{
    NSLog(@"%@", engine);
    for (int i=0; i<4; i++) {
        NSLog(@"%@", [self tireAtIndex:i]);
    }
    NSLog(@"\n");
}

@end