//
//  STTitleButton.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STTitleButton.h"



@implementation STTitleButton

- (instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.adjustsImageWhenHighlighted = NO;
    }

    return self;
}

- (void)awakeFromNib;
{
    self.adjustsImageWhenHighlighted = NO;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state;
{
    [super setTitle:title
           forState:state
    ];

    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state;
{
    [super setImage:image
           forState:state];

    [self sizeToFit];
}

- (void)layoutSubviews;
{
    [super layoutSubviews];

    if (self.titleLabel.x > self.imageView.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}


@end
