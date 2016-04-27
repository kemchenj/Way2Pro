//
//  STShop.m
//  自定义UIButton
//
//  Created by kemchenj on 4/25/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STShop.h"

@implementation STShop

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+(instancetype)shopWithDict:(NSDictionary *)dict
{
    STShop *shop = [[STShop alloc] initWithDict:dict];
    return shop;
}

@end
