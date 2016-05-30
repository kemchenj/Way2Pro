//
//  STDrawView.m
//  graphicStack
//
//  Created by kemchenj on 5/14/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STDrawView.h"



@implementation STDrawView

- (void)drawRect:(CGRect)rect;
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(10, 125)];
    [bezierPath addLineToPoint:CGPointMake(240, 125)];

    CGContextAddPath(context, bezierPath.CGPath);
    CGContextSaveGState(context);

    [[UIColor redColor] set];
    CGContextSetLineWidth(context, 5);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextStrokePath(context);

    bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(240, 125)];
    [bezierPath addLineToPoint:CGPointMake(125, 240)];

    CGContextAddPath(context, bezierPath.CGPath);
    CGContextRestoreGState(context);
    CGContextStrokePath(context);
}


@end
