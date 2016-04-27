//
//  STButton.m
//  UIButton
//
//  Created by kemchenj on 4/25/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STButton.h"

@implementation STButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.backgroundColor = [UIColor blueColor];
        self.titleLabel.backgroundColor = [UIColor purpleColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat imageW = self.frame.size.width;
    CGFloat imageH = imageW;
    self.imageView.frame = CGRectMake(0, 0, imageW, imageH);
    
    CGFloat titleW = imageW;
    CGFloat titleH = self.frame.size.height - imageH;
    self.titleLabel.frame = CGRectMake(0, imageH, titleW, titleH);
}

@end
