//
//  ViewController.m
//  animateSet
//
//  Created by kemchenj on 5/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *uiView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];

    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position";
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(arc4random_uniform(300), arc4random_uniform(500))];

    CABasicAnimation *animation1 = [CABasicAnimation animation];
    animation1.keyPath = @"transform.scale";
    animation1.toValue = @0.5;

    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"transform.rotation";
    animation2.toValue = @(M_PI);

    animationGroup.animations = @[animation, animation1, animation2];
    [_uiView.layer addAnimation:animationGroup
                         forKey:nil
    ];
}


@end
