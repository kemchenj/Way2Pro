//
//  STCover.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STCover.h"



#define STKeyWindow [UIApplication sharedApplication].keyWindow



@implementation STCover

+ (void)show;
{
    STCover *cover = [[STCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha           = 0.6;

    [STKeyWindow addSubview:cover];
}

+ (void)hide;
{
    for (UIView *cover in STKeyWindow.subviews) {
        if ([cover isKindOfClass:[STCover class]]) {
            [cover removeFromSuperview];
        }
    }
}


@end
