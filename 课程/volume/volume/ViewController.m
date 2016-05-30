//
//  ViewController.m
//  volume
//
//  Created by kemchenj on 5/20/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.frame             = self.contentView.bounds;
    layer.instanceCount     = 5;
    layer.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
    layer.instanceDelay     = 0.3;

    [self.contentView.layer addSublayer:layer];

    CALayer *redLayer = [CALayer layer];
    redLayer.anchorPoint     = CGPointMake(0, 1);
    redLayer.position        = CGPointMake(0, 200);
    redLayer.bounds          = CGRectMake(0, 0, 30, 100);
    redLayer.backgroundColor = [UIColor redColor].CGColor;

    [layer addSublayer:redLayer];

    //CALayer *redLayer1 = [CALayer layer];
    //redLayer1.anchorPoint     = CGPointMake(0, 1);
    //redLayer1.position        = CGPointMake(40, 200);
    //redLayer1.bounds          = CGRectMake(0, 0, 30, 100);
    //redLayer1.backgroundColor = [UIColor darkGrayColor].CGColor;
    //
    //[layer addSublayer:redLayer1];

    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath      = @"transform.scale.y";
    animation.toValue      = @0;
    animation.repeatCount  = MAXFLOAT;
    animation.duration     = .5;
    animation.autoreverses = YES;

    [redLayer addAnimation:animation
                    forKey:nil
    ];
    //[redLayer1 addAnimation:animation
    //                 forKey:nil
    //];
}

@end
