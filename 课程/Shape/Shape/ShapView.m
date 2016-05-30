//
//  ShapView.m
//  Shape
//
//  Created by kemchenj on 5/13/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ShapView.h"

@implementation ShapView

- (void)drawRect:(CGRect)rect
{
    CGPoint center = CGPointMake((CGFloat) (rect.size.width * 0.5), (CGFloat) (rect.size.height * 0.5));
    CGFloat radius = (CGFloat) (rect.size.width * 0.5 * 0.5);

    CGContextRef cgContext = UIGraphicsGetCurrentContext();

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:100
                                                    startAngle:0
                                                      endAngle:(CGFloat) M_PI_2
                                                     clockwise:YES
    ];

    [path addLineToPoint:center];

    [path closePath];

    CGContextAddPath(cgContext, path.CGPath);

    [[UIColor redColor] setFill];
    [[UIColor greenColor] setStroke];

    CGContextSetLineWidth(cgContext, 5);

    CGContextDrawPath(cgContext, kCGPathFillStroke);
}


@end
