//
//  STShop.m
//  商品动画
//
//  Created by kemchenj on 4/23/16.
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
    STShop *shop = [[self alloc] initWithDict:dict];
    return shop;
}
@end
