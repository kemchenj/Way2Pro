//
//  MJCar.h
//  08-汽车品牌
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJCar : NSObject
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  名称
 */
@property (nonatomic, copy) NSString *name;

+ (instancetype)carWithDict:(NSDictionary *)dict;
@end
