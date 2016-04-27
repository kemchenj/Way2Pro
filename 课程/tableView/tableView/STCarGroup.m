//
//  STCarShop.m
//  tableView
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STCarGroup.h"
#import "STCar.h"

@implementation STCarGroup

+ (instancetype)carGroupWithDict:(NSDictionary *)dict
{
    STCarGroup *carGroup = [[STCarGroup alloc] init];
    carGroup.header = dict[@"header"];
    carGroup.footer = dict[@"footer"];
    
    NSMutableArray *cars = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        [cars addObject:[STCar carWithDict:carDict]];
    }
    
    carGroup.cars = cars;
    
    return carGroup;
}

@end
