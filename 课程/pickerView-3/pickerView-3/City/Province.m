//
// Created by kemchenj on 5/9/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "Province.h"



@implementation Province

+ (instancetype)provinceWithDict:(NSDictionary *)dictionary
{
    Province *province = [[Province alloc] init];

    [province setValuesForKeysWithDictionary:dictionary];

    return province;
}

@end