//
//  STPieView.m
//  pieView
//
//  Created by kemchenj on 5/14/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STPieView.h"



@implementation STPieView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect;
{
    NSArray *data = @[@25, @25, @50];

    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat startA = 0;
    CGFloat endA   = 0;
    CGFloat angle  = 0;

    for (NSNumber *number in data) {
        startA = endA;
        angle  = [number integerValue] / 100.0 * M_PI * 2;
        endA   = startA + angle;

        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:100
                                                        startAngle:startA
                                                          endAngle:endA
                                                         clockwise:YES
        ];

        [path addLineToPoint:center];

        [[self randomColor] set];

        [path fill];
    }
}

- (UIColor *)randomColor;
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;

    return [UIColor colorWithRed:r
                           green:g
                            blue:b
                           alpha:1.0
    ];
}

@end
