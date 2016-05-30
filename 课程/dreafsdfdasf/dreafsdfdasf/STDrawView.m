//
//  STDrawView.m
//  dreafsdfdasf
//
//  Created by kemchenj on 5/14/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STDrawView.h"

@implementation STDrawView

- (void)drawRect:(CGRect)rect;
{
    CGContextRef cgContext = UIGraphicsGetCurrentContext();

    CGContextTranslateCTM(cgContext, 100, 100);

    CGContextRotateCTM(cgContext, M_PI_4);

    CGContextScaleCTM(cgContext, 0.5, 0.5);

    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-50, -100, 100, 200)];

    [[UIColor redColor] set];

    [bezierPath fill];
}


@end
