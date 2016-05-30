//
//  ViewController.m
//  swipe
//
//  Created by kemchenj on 5/15/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)pan:(UIPanGestureRecognizer *)sender
{
    CGPoint curP = [sender locationInView:sender.view];

    CGFloat wh        = 30;
    CGFloat x         = curP.x - wh * 0.5;
    CGFloat y         = curP.y - wh * 0.5;
    CGRect  clearRect = CGRectMake(x, y, wh, wh);

    UIGraphicsBeginImageContextWithOptions(sender.view.bounds.size, NO, 0);

    CGContextRef ctx = UIGraphicsGetCurrentContext();

    [sender.view.layer renderInContext:ctx];

    CGContextClearRect(ctx, clearRect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    UIImageView *imageView = (UIImageView *) sender.view;

    imageView.image = image;
}

@end
