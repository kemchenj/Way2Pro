//
//  ViewController.m
//  indicator
//
//  Created by kemchenj on 5/20/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *contentView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];

    NSInteger count = 20;
    CGFloat   angle = M_PI * 2 / count;

    replicatorLayer.frame             = _contentView.bounds;
    replicatorLayer.instanceCount     = count;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    replicatorLayer.instanceDelay     = 1.0 / count;

    [_contentView.layer addSublayer:replicatorLayer];

    CALayer *whiteLayer = [CALayer layer];
    whiteLayer.transform       = CATransform3DMakeScale(0, 0, 0);
    whiteLayer.frame           = CGRectMake(70, 10, 10, 10);
    whiteLayer.backgroundColor = [UIColor whiteColor].CGColor;

    [replicatorLayer addSublayer:whiteLayer];

    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath     = @"transform.scale";
    animation.fromValue   = @1;
    animation.toValue     = @0;
    animation.repeatCount = MAXFLOAT;
    animation.duration    = 1;

    [whiteLayer addAnimation:animation
                      forKey:nil
    ];
}


@end
