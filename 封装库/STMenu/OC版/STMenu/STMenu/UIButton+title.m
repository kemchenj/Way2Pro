//
// Created by kemchenj on 5/27/16.
// Copyright (c) 2016 ST. All rights reserved.
//

#import "UIButton+title.h"



@implementation UIButton (title)

+(UIButton *)buttonWithTitle:(NSString *)title tag:(int)tagNum
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.text = title;
    button.tag = tagNum;

    return button;
}

@end