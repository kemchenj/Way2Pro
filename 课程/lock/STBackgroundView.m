//
//  STBackgroundView.m
//  lock
//
//  Created by kemchenj on 5/15/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STBackgroundView.h"



@implementation STBackgroundView

- (void)drawRect:(CGRect)rect;
{
    UIImage *image = [UIImage imageNamed:@"Home_refresh_bg.png"];

    [image drawInRect:rect];
}


@end
