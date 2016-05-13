//
//  ViewController.m
//  coderThind
//
//  Created by kemchenj on 5/12/16.
//  Copyright (c) 2016 ST. All rights reserved.
//


#import "ViewController.h"
#import "MyView.h"
#import "STViewController.h"



@interface ViewController ()

@end



@implementation ViewController

- (void)awakeFromNib
{
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    MyView *view = [[MyView alloc] init];
    view.backgroundColor = [UIColor grayColor];
    view.frame           = CGRectMake(50, 50, 200, 200);

    STViewController *viewController = [[STViewController alloc] init];
    viewController.view.frame           = self.view.frame;
    viewController.view.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:viewController.view];
    [self addChildViewController:viewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end