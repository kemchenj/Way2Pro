//
//  DrawView.m
//  atom
//
//  Created by kemchenj on 5/20/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "DrawView.h"



@interface DrawView ()

@property (nonatomic, weak) CALayer        *greenLayer;
@property (nonatomic, strong) UIBezierPath *path;

@end



@implementation DrawView

#pragma mark - <Property>

- (UIBezierPath *)path;
{
    if (!_path) {
        _path = [UIBezierPath bezierPath];
    }
    return _path;
}

- (CALayer *)greenLayer;
{
    if (!_greenLayer) {
        CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
        replicatorLayer.frame         = self.bounds;
        replicatorLayer.instanceCount = 600;
        replicatorLayer.instanceDelay = 0.05;

        [self.layer addSublayer:replicatorLayer];

        CALayer *greenLayer = [CALayer layer];
        greenLayer.backgroundColor = [UIColor greenColor].CGColor;
        greenLayer.frame           = CGRectMake(-1000, 0, 10, 10);
        greenLayer.cornerRadius    = 5;
        self.greenLayer            = greenLayer;

        [replicatorLayer addSublayer:greenLayer];
    }

    return _greenLayer;
}



#pragma mark - <Draw>

- (void)drawRect:(CGRect)rect;
{
    [_path stroke];
}

- (void)startAnimate;
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath     = @"position";
    animation.path        = _path.CGPath;
    animation.duration    = 2;
    animation.repeatCount = MAXFLOAT;

    [self.greenLayer addAnimation:animation
                           forKey:nil
    ];
}

- (void)reDraw;
{
    [self.path removeAllPoints];

    [self setNeedsDisplay];

    [self.greenLayer removeAllAnimations];
}



#pragma mark - <Touch>

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    UITouch *touch = [touches anyObject];

    CGPoint curP = [touch locationInView:self];

    [self.path moveToPoint:curP];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    UITouch *touch = [touches anyObject];

    CGPoint curP = [touch locationInView:self];

    [_path addLineToPoint:curP];

    [self setNeedsDisplay];
}


@end
