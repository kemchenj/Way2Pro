//
//  ViewController.m
//  CATransaction
//
//  Created by kemchenj on 5/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



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
    static int i          = 2;
    NSString   *imageName = [NSString stringWithFormat:@"%d",
                                                       i];
    _imageView.image = [UIImage imageNamed:imageName];

    i++;
    if (i > 3) {
        i = 1;
    }

    CATransition *transition = [CATransition animation];
    transition.type    = @"pageCurl";
    transition.subtype = kCATransitionFromLeft;
    transition.startProgress = 0;
    transition.endProgress = 1;
    transition.duration = 1;

    [_imageView.layer addAnimation:transition
                            forKey:nil
    ];
}


@end
