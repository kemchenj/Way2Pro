//
//  MJCarGroup.h
//  08-汽车品牌
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJCarGroup : NSObject
/**
 *  这组的标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  存放的所有的汽车品牌(里面装的都是MJCar模型)
 */
@property (nonatomic, strong) NSArray *cars;

+ (instancetype)groupWithDict:(NSDictionary *)dict;
@end
