//
//  STShop.h
//  商品动画
//
//  Created by kemchenj on 4/23/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STShop : NSObject

@property(nonatomic, copy)NSString *icon;
@property(nonatomic, copy)NSString *name;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)shopWithDict:(NSDictionary *)dict;

@end
