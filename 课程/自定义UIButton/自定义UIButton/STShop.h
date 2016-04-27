//
//  STShop.h
//  自定义UIButton
//
//  Created by kemchenj on 4/25/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STShop : NSObject

@property(nonatomic, copy)NSString *icon;
@property(nonatomic, copy)NSString *name;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)shopWithDict:(NSDictionary *)dict;

@end
