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

-(void) setValue:(id)value forUndefinedKey:(NSString *)key
{
    if (stuff == nil) {
        stuff = [[NSMutableDictionary alloc] init];
    }
    [stuff setValue:value forKey:key];
}
// 使用kvc并且输入了错误的值的时候, cocoa不能识别使用的键, 所以会放弃操作
// 我们可以通过重定义valueForUndefinedKey的setter和getter方法去处理未定义的键

-(id) valueForUndefinedKey:(NSString *)key
{
    id value = [stuff valueForKey:key];
    return value;
}

@end
