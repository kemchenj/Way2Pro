//
//  ViewController.m
//  basicAnimation
//
//  Created by kemchenj on 5/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



#define keyPath(objc, keyPath) @(((void)objc.keyPath, #keyPath))



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView      *redView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];

    basicAnimation.keyPath     = keyPath(self.imageView, transform);
    basicAnimation.toValue     = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1)];
    basicAnimation.repeatCount = MAXFLOAT;

    NSLog(@"basicAnimation.toValue = %@", basicAnimation.toValue);

    [_imageView.layer addAnimation:basicAnimation
                            forKey:nil
    ];
}

@end
