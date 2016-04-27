//
//  STCar.h
//  index line
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STCar : NSObject

@property(nonatomic, copy)NSString *icon;
@property(nonatomic, copy)NSString *name;

+(instancetype)carWithDict:(NSDictionary *)dict;

@end
