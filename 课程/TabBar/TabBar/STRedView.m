//
// Created by kemchenj on 5/13/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "STRedView.h"



@interface STRedView ()

@end



@implementation STRedView

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];

    CGPoint curP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];

    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;

    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:1 animations:^{
        self.transform = CGAffineTransformTranslate(self.transform, 100.0, 0);
    }];
}


@end