//
//  STCar.h
//  tableView
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STCar : NSObject

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *icon;

+(instancetype)carWithName:(NSString *)name icon:(NSString *)icon;
+ (instancetype)carWithDict:(NSDictionary *)dict;
@end
