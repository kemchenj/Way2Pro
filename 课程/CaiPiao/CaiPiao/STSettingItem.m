//
//  STSettingItem.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STSettingItem.h"



@implementation STSettingItem

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title;
{
    STSettingItem *item = [[self alloc] init];

    item.icon  = icon;
    item.title = title;

    return item;
}


@end
