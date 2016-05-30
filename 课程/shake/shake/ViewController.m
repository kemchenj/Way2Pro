//
//  ViewController.m
//  shake
//
//  Created by kemchenj on 5/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



#define angle2Radion(angle) (angle / 180.0 * M_PI)



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    //CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    //
    //animation.keyPath = @"position";
    //
    //UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:_imageView.center
    //                                                    radius:100
    //                                                startAngle:0
    //                                                  endAngle:M_PI * 2
    //                                                 clockwise:YES
    //];
    //
    //animation.path        = path.CGPath;
    //animation.repeatCount = MAXFLOAT;
    //animation.duration    = 1;
    //
    //[_imageView.layer addAnimation:animation
    //                        forKey:nil
    //];

    [self animation];
}

- (void)animation
{
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animation];

    keyframeAnimation.keyPath     = @"transform.rotation";
    keyframeAnimation.values      = @[@(angle2Radion(-5)), @(angle2Radion(5)), @(angle2Radion(-5))];
    keyframeAnimation.duration    = 2;
    keyframeAnimation.repeatCount = MAXFLOAT;

    [_imageView.layer addAnimation:keyframeAnimation
                            forKey:nil
    ];
}

@end
