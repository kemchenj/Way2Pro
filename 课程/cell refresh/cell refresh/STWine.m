//
//  STWine.m
//  cell refresh
//
//  Created by kemchenj on 4/29/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STWine.h"

@implementation STWine

+(instancetype)wineWithDict:(NSDictionary *)dict
{
    STWine *wine = [[STWine alloc] init];
    [wine setValuesForKeysWithDictionary:dict];
    return wine;
}

@end
