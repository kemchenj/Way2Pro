//
//  ViewController.m
//  screenShot
//
//  Created by kemchenj on 5/15/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end



@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);

    CGContextRef ctx = UIGraphicsGetCurrentContext();

    //CALayer *layer = self.view.layer;
    //
    //[layer renderInContext:ctx];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    NSData *data = UIImageJPEGRepresentation(image, 0.0000001);

    [data writeToFile:@"/Users/kemchenj/Desktop/tetet.jpg"
           atomically:YES
    ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
