//
// Created by kemchenj on 5/9/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "ThirdViewController.h"



@implementation ThirdViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Third";
}

- (IBAction)rootController {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end