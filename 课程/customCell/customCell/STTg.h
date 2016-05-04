//
//  STTg.h
//  customCell
//
//  Created by kemchenj on 4/28/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STTg : NSObject

@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *buyCount;

+(instancetype)tgWithDict:(NSDictionary *)dict;
@end
