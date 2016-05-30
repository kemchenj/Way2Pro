//
//  ViewController.m
//  frameAnimation
//
//  Created by kemchenj on 5/18/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (nonatomic, weak) CALayer   *fishLayer;
@property (nonatomic, strong) NSArray *fishes;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.layer.contents = (id) [UIImage imageNamed:@"bg.png"].CGImage;

    CALayer *fishLayer = [CALayer layer];
    fishLayer.frame    = CGRectMake(100, 288, 89, 40);
    fishLayer.contents = (id) [UIImage imageNamed:@"bg.png"];

    [self.view.layer addSublayer:fishLayer];
    self.fishLayer = fishLayer;

    NSMutableArray *tempArray = [NSMutableArray array];

    for (int i = 0; i < 10; ++i) {
        NSString *string = [NSString stringWithFormat:@"fish%d", i];
        UIImage  *image  = [UIImage imageNamed:string];
        [tempArray addObject:image];
    }
    self.fishes = tempArray;
    NSLog(@"self.fishes = %@", self.fishes);

    [NSTimer scheduledTimerWithTimeInterval:0.05
                                     target:self
                                   selector:@selector(update)
                                   userInfo:nil
                                    repeats:YES
    ];
}

static int fishIndex = 0;

- (void)update;
{
    UIImage *image = self.fishes[fishIndex];
    self.fishLayer.contents = (id) image.CGImage;
    fishIndex++;
    if (fishIndex > 9) {
        fishIndex = 0;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";

    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 100, 300, 200)];
    animation.path            = path.CGPath;
    animation.duration        = 5.0;
    animation.repeatCount     = HUGE;
    animation.calculationMode = @"cubicPaced";
    animation.rotationMode    = @"autoReverse";

    [self.fishLayer addAnimation:animation
                          forKey:nil
    ];
}


@end
