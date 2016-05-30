//
//  ViewController.m
//  coreAnimate
//
//  Created by kemchenj on 5/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()<del>

@property (weak, nonatomic) IBOutlet UIView *redView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         _redView.layer.position = CGPointMake(250, 500);
                     }
                     completion:^(BOOL finished) {
                         NSLog(@" NSStringFromCGPoint(rev) = %@", NSStringFromCGPoint(_redView.layer.position));
                     }
    ];
}

- (void)animate
{
    CABasicAnimation *animation = [CABasicAnimation animation];

    animation.keyPath  = @"position";
    animation.toValue  = [NSValue valueWithCGPoint:CGPointMake(250, 500)];
    animation.delegate = self;
    [self animationDidStop:nil
                  finished:nil
    ];

    UIApplication *application = [UIApplication sharedApplication];
    UIApplication *uiApplication = [UIApplication sharedApplication];

    NSLog(@"animation = %@", animation);


    [_redView.layer addAnimation:animation
                          forKey:nil
    ];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
{
    NSLog(@"%@", NSStringFromCGPoint(_redView.layer.position));
}


@end
