//
//  STCar.m
//  tableView
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STCar.h"

@implementation STCar

+(instancetype)carWithName:(NSString *)name icon:(NSString *)icon
{
    STCar *car = [[STCar alloc] init];
    car.name = name;
    car.icon = icon;
    return car;
}

+ (instancetype)carWithDict:(NSDictionary *)dict
{
    STCar *car = [STCar carWithName:dict[@"name"] icon:dict[@"icon"]];
    return car;
}

@end
