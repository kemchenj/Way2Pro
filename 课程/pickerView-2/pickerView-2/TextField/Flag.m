//
// Created by kemchenj on 5/7/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "Flag.h"



@implementation Flag

+ (instancetype)flagWithDict:(NSDictionary *)dictionary
{
    Flag *flag = [[self alloc] init];
    [flag setValuesForKeysWithDictionary:dictionary];

    return flag;
}


@end