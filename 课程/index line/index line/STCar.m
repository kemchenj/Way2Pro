//
//  STCar.m
//  index line
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STCar.h"

@implementation STCar

+(instancetype)carWithDict:(NSDictionary *)dict
{
    STCar *car = [[STCar alloc] init];
//    car.icon = dict[@"icon"];
//    car.name = dict[@"name"];
    [car setValuesForKeysWithDictionary:dict];
    
    return car;
}

@end
