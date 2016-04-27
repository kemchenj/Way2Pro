//
//  STCarGroup.m
//  index line
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STCarGroup.h"
#import "STCar.h"

@implementation STCarGroup

+(instancetype)groupWithDict:(NSDictionary *)dict
{
    STCarGroup *carGroup = [[STCarGroup alloc] init];
    carGroup.title = dict[@"title"];
    
    NSMutableArray *cars = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        [cars addObject:[STCar carWithDict:carDict]];
    }
    carGroup.cars = cars;
    
    return carGroup;
}

@end
