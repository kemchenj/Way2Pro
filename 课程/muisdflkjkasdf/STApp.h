//
// Created by kemchenj on 5/30/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface STApp : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *download;

- (STApp *)appWithDict:(NSDictionary *)dictionary;

@end