//
//  Garage.m
//  day15
//
//  Created by xmg on 3/29/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "Garage.h"

@implementation Garage

@synthesize name;

-(void) addCar:(Car *)car
{
    if (cars == nil) {
        cars = [[NSMutableArray alloc] init];
    }
    [cars addObject:car];
}
// 惰性初始化

-(void) print
{
    NSLog(@"%@", name);
    for (Car *car in cars) {
        NSLog(@"%@", car);
    }
}

@end
