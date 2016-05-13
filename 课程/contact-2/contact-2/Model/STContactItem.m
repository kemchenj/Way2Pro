//
// Created by kemchenj on 5/10/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "STContactItem.h"



@interface STContactItem ()

@end



@implementation STContactItem

+ (instancetype)itemWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber
{
    STContactItem *item = [[STContactItem alloc] init];
    item.name        = name;
    item.phoneNumber = phoneNumber;
    return item;
}

@end