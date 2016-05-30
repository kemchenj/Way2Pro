//
//  ViewController.m
//  mark
//
//  Created by kemchenj on 5/14/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage * image= [UIImage imageNamed:@"小黄人.jpg"];

    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);

    [image drawAtPoint:CGPointZero];

    NSString *string = @"kem";
    [string drawAtPoint:CGPointZero
         withAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]}
    ];
    image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    NSData *data = UIImageJPEGRepresentation(image, 1.0);

    [data writeToFile:@"/Users/kemchenj/Desktop/test.jpg"
           atomically:YES
    ];
}

@end
