//
// Created by kemchenj on 5/9/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Province : NSObject

@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) NSString *name;

+(instancetype)provinceWithDict:(NSDictionary *)dictionary;

@end