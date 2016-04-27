//
//  STCarShop.h
//  tableView
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STCarGroup : NSObject

@property(copy, nonatomic)NSString *header;
@property(copy, nonatomic)NSString *footer;
@property(strong, nonatomic)NSArray *cars;

@end
