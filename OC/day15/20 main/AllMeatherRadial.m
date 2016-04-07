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

//@synthesize rainHandling;
//@synthesize snowHandling;
// synthesize可以自动生成访问代码, 会自动生成snowHanding和setSnowHandling方法
// 这是编译器自动添加的
// 但是如果有set或get有额外参数的话,就没办法用这种方法自动生成

-(NSString *) description
{
    NSString *desc;
    desc = [[NSString alloc] initWithFormat:@"AllMeatherRadial: %.1f / %.1f / %.1f / %.1f", self.pressure, self.treadDepth, self.rainHandling, self.snowHandling];
    return desc;
}

-(id) initWithPressure:(float)p treadDepth:(float) td
{
    if (self = [super initWithPressure:p treadDepth:td]) {
        self.rainHandling = 23.7;
        self.snowHandling = 42.5;
    }
    return self;
}

@end
