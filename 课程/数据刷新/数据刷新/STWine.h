//
// Created by kemchenj on 5/2/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface STWine : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *image;
@property(nonatomic, strong) NSString *money;

+(instancetype)wineWithDict:(NSDictionary *)dictionary;

@end