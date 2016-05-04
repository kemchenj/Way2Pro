//
//  STWine.h
//  购物车
//
//  Created by kemchenj on 4/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface STWine : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *image;
@property(nonatomic, copy) NSString *money;

@property(nonatomic, assign) int count;

@end
