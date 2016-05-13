//
// Created by kemchenj on 5/7/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Flag : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;

+(instancetype)flagWithDict:(NSDictionary *)dictionary;

@end