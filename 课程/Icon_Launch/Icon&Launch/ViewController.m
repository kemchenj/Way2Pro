//
//  ViewController.m
//  Icon&Launch
//
//  Created by kemchenj on 5/1/16.
//  Copyright (c) 2016 ST. All rights reserved.
//


#import "ViewController.h"



@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame           = CGRectMake(0, 0, 100, 100);
    imageView.image           = [UIImage imageNamed:@"home"];
    imageView.backgroundColor = [UIColor redColor];

    [self.view addSubview:imageView];
}

@end