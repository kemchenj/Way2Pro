//
//  STWine.h
//  cell refresh
//
//  Created by kemchenj on 4/29/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STWine : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *money;

@property (nonatomic, assign, getter=isChecked) BOOL checked;

+(instancetype)wineWithDict:(NSDictionary *)dict;

@end
