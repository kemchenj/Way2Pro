//
// Created by kemchenj on 5/7/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//



#import <UIKit/UIKit.h>
@class Flag;



@interface FlagView : UIView

@property (nonatomic, strong) Flag *flag;

+ (instancetype)flagView;

@end