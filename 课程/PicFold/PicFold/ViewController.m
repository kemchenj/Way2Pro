//
//  ViewController.m
//  PicFold
//
//  Created by kemchenj on 5/20/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomView;
@property (nonatomic, weak) CAGradientLayer      *layer;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _topView.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    _topView.layer.anchorPoint  = CGPointMake(0.5, 1);

    _bottomView.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    _bottomView.layer.anchorPoint  = CGPointMake(0.5, 0);

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame   = _bottomView.bounds;
    gradientLayer.colors  = @[(id) [UIColor clearColor].CGColor, (id) [UIColor blackColor].CGColor];
    gradientLayer.opacity = 0;

    self.layer = gradientLayer;

    [_bottomView.layer addSublayer:_layer];
}

- (IBAction)pan:(UIPanGestureRecognizer *)sender
{
    CGPoint transP = [sender translationInView:sender.view];

    CGFloat angle = -transP.y / 200.0 * M_PI;

    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34 = -1 / 400.0;
    transform3D = CATransform3DRotate(transform3D, angle, 1, 0, 0);

    _topView.layer.transform = transform3D;
    _layer.opacity           = transP.y / 200.0;
    NSLog(@"_layer.opacity = %f", _layer.opacity);

    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"_layer.opacity = %f", _layer.opacity);
        _layer.opacity = 0;
        [UIView animateWithDuration:.9
                              delay:0
             usingSpringWithDamping:0.2 // 弹性系数
              initialSpringVelocity:0.5
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             _topView.layer.transform = CATransform3DIdentity;
                         }
                         completion:^(BOOL finished) {
                         }
        ];
    }
}

@end
