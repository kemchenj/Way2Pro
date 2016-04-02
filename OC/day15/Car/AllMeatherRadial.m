//
//  AllWeatherRadial.m
//  day15
//
//  Created by xmg on 3/27/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllMeatherRadial.h"

@implementation AllMeatherRadial

-(NSString *) description
{
    NSString *desc;
    desc = [[NSString alloc] initWithFormat:@"AllMeatherRadial: %.1f / %.1f / %.1f / %.1f", [self pressure], [self treadDepth], [self rainHandling], [self snowHandling]];
    return desc;
}

-(void) setRainHandling: (float) rh
{
    rainHandling = rh;
}
-(float) rainHandling
{
    return rainHandling;
}

-(void) setSnowhandling: (float) sh
{
    snowHandling = sh;
}
-(float) snowHandling
{
    return snowHandling;
}

-(id) initWithPressure:(float)p treadDepth:(float) td
{
    if (self = [super initWithPressure:p treadDepth:td]) {
        rainHandling = 23.7;
        snowHandling = 42.5;
    }
    return self;
}
// 重写父类tire的方法, 把rainHandling和snowHandling也进行初始化

@end
