//
//  STSnowView.m
//  snowtime
//
//  Created by kemchenj on 5/14/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STSnowView.h"



@implementation STSnowView

- (void)drawRect:(CGRect)rect;
{
    static CGFloat snowY = 0;

    UIImage *image = [UIImage imageNamed:@"雪花.png"];
    [image drawAtPoint:CGPointMake(50, snowY)];

    snowY += 10;

    if (snowY > rect.size.height) {
        snowY = 0;
    }
}

- (void)awakeFromNib;
{
    CADisplayLink *caDisplayLink = [CADisplayLink displayLinkWithTarget:self
                                                               selector:@selector(setNeedsDisplay)];
    [caDisplayLink addToRunLoop:[NSRunLoop mainRunLoop]
                        forMode:NSDefaultRunLoopMode
    ];
}

@end
