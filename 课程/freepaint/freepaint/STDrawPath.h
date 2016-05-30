//
// Created by kemchenj on 5/16/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface STDrawPath : UIBezierPath

@property (nonatomic, strong) UIColor *lineColor;

- (instancetype)initWithLineColor:(UIColor *)lineColor;
+ (instancetype)pathWithLineColor:(UIColor *)lineColor;


@end