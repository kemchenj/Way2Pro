//
//  STCarGroup.h
//  index line
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STCarGroup : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *cars;

+(instancetype)groupWithDict:(NSDictionary *)dict;

@end
