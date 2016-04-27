//
//  MJCarGroup.m
//  08-汽车品牌
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 小码哥. All rights reserved.
//

#import "MJCarGroup.h"
#import "MJCar.h"

@implementation MJCarGroup
+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    MJCarGroup *group = [[self alloc] init];
    group.title = dict[@"title"];
    
    NSMutableArray *cars = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        [cars addObject:[MJCar carWithDict:carDict]];
    }
    group.cars = cars;
    
    return group;
}
@end
