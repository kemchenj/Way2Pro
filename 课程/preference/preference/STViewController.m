//
// Created by kemchenj on 5/11/16.
// Copyright (c) 2016 ST. All rights reserved.
//

#import "STViewController.h"



@interface STViewController ()

@end



@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults objectForKey:@"name"];
    NSLog(@"%@", name);
}

@end