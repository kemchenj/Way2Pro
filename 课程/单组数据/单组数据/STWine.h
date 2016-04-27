//
//  STWine.h
//  单组数据
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STWine : NSObject

@property(copy, nonatomic) NSString *name;
@property(copy, nonatomic) NSString *icon;
@property(copy, nonatomic) NSString *price;

+(instancetype)wineWithDict:(NSDictionary *)dict;

@end
