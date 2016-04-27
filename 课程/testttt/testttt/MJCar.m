//
//  MJCar.m
//  08-汽车品牌
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 小码哥. All rights reserved.
//

#import "MJCar.h"

@implementation MJCar
+ (instancetype)carWithDict:(NSDictionary *)dict
{
    MJCar *car = [[self alloc] init];
    [car setValuesForKeysWithDictionary:dict];
    return car;
}
@end
