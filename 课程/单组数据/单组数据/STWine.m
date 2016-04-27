//
//  STWine.m
//  单组数据
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STWine.h"

@implementation STWine

+(instancetype)wineWithDict:(NSDictionary *)dict
{
    STWine *wine = [[STWine alloc] init];
    wine.icon = dict[@"image"];
    wine.name = dict[@"name"];
    wine.price = dict[@"money"];
    
    return wine;
}

@end
