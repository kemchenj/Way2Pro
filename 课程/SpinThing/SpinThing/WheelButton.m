//
// Created by kemchenj on 5/18/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "WheelButton.h"



@interface WheelButton ()

@end



@implementation WheelButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect;
{
    CGFloat imageW = 40;
    CGFloat imageH = 47;
    CGFloat imageX = (self.bounds.size.width - imageW) * 0.5;
    CGFloat imageY = 20;

    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end