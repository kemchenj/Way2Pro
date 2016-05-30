//
//  ViewController.m
//  CALayer
//
//  Created by kemchenj on 5/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView      *redView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self imageLayer];
    [self viewLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    [UIView animateWithDuration:1
                     animations:^{
                         _imageView.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 1);
                     }
    ];
}

- (void)imageLayer;
{
    CALayer *layer = _imageView.layer;
    layer.cornerRadius  = 50;
    layer.masksToBounds = YES;
    layer.borderWidth   = 1;
    layer.borderColor   = [UIColor whiteColor].CGColor;

    NSLog(@"_imageView.layer.contents = %@", layer.contents);
}

- (void)viewLayer
{
    CALayer *layer = _redView.layer;
    layer.shadowOpacity = 1;
    layer.shadowColor   = [UIColor yellowColor].CGColor;
    layer.shadowRadius  = 10;

    layer.cornerRadius  = 50;
    layer.borderWidth   = 2;
    layer.borderColor   = [UIColor whiteColor].CGColor;
}

@end
