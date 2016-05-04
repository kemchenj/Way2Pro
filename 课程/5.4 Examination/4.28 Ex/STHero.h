//
//  STHero.h
//  5.4 Examination
//
//  Created by kemchenj on 5/4/10.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface STHero : NSObject

@property (nonatomic, copy  ) NSString *icon;
@property (nonatomic, copy  ) NSString *intro;
@property (nonatomic, copy  ) NSString *name;

@property (nonatomic, assign) CGRect   nameFrame;
@property (nonatomic, assign) CGRect   iconFrame;
@property (nonatomic, assign) CGRect   introFrame;
@property (nonatomic, assign) CGFloat  cellHeight;

+(instancetype)heroWithDict:(NSDictionary *)dict;
@end
