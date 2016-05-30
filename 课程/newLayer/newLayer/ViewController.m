//
//  ViewController.m
//  newLayer
//
//  Created by kemchenj on 5/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *greenView;
@property (nonatomic, weak) CALayer         *layer;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupLayer];
}

- (void)setupLayer;
{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame           = CGRectMake(50, 50, 100, 100);
    layer.contents        = (id) [UIImage imageNamed:@"阿狸头像.png"].CGImage;

    [self.view.layer addSublayer:layer];

    self.layer = layer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    [CATransaction begin];

    [CATransaction setAnimationDuration:0.5];

    CALayer *layer = self.layer;
    layer.position        = CGPointMake(arc4random_uniform(250), arc4random_uniform(500));
    layer.backgroundColor = [self randomColor].CGColor;
    layer.cornerRadius    = arc4random_uniform(50);
    layer.borderWidth     = arc4random_uniform(10);
    layer.borderColor     = [self randomColor].CGColor;

    [CATransaction commit];
}

- (UIColor *)randomColor;
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;

    return [UIColor colorWithRed:r
                           green:g
                            blue:b
                           alpha:1
    ];
}


@end
