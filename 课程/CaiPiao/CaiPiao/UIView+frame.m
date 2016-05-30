//
//  UIView+frame.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

@implementation UIView (frame)

- (void)setCenterY:(CGFloat)centerY;
{
    CGPoint center = self.center;
    center.y    = centerY;
    self.center = center;
}

- (CGFloat)centerY;
{
    return self.center.y;
}

- (void)setCenterX:(CGFloat)centerX;
{
    CGPoint center = self.center;
    center.x    = centerX;
    self.center = center;
}

- (CGFloat)centerX;
{
    return self.center.x;
}

- (void)setY:(CGFloat)y;
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame     = frame;
}

- (CGFloat)y;
{
    return self.frame.origin.y;
}

- (void)setX:(CGFloat)x;
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame     = frame;
}

- (CGFloat)x;
{
    return self.frame.origin.x;
}

- (void)setWidth:(CGFloat)width;
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame       = frame;
}

- (CGFloat)width;
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height;
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame        = frame;
}

- (CGFloat)height;
{
    return self.frame.size.height;
}


@end
