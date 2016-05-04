//
// Created by kemchenj on 5/2/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "STWine.h"



@implementation STWine

+ (instancetype)wineWithDict:(NSDictionary *)dictionary
{
    STWine *wine = [[STWine alloc] init];
    [wine setValuesForKeysWithDictionary:dictionary];
    return wine;
}

@end