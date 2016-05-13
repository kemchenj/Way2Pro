//
// Created by kemchenj on 5/10/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface STContactItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phoneNumber;
+(instancetype)itemWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber;

@end