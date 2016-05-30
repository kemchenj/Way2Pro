//
//  STProgressView.m
//  DownloadProgress
//
//  Created by kemchenj on 5/13/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STProgressView.h"



@implementation STProgressView

- (void)drawRect:(CGRect)rect
{
    CGSize  size   = rect.size;
    CGPoint center = CGPointMake(size.width * 0.5, size.height * 0.5);
    CGFloat endA   = -M_PI_2 + M_PI * 2 * _progress;

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:size.width * 0.5 - 4
                                                    startAngle:-M_PI_2
                                                      endAngle:endA
                                                     clockwise:YES
    ];

    [path stroke];
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;

    [self setNeedsDisplay];
}


@end
