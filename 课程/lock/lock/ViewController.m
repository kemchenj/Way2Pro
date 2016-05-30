//
//  ViewController.m
//  lock
//
//  Created by kemchenj on 5/15/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STBackgroundView.h"
#import "STLockView.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    STLockView *lockView = [[STLockView alloc] initWithFrame:self.view.bounds];
    NSLog(@"lockView = %@", lockView);
    NSLog(@"self.view.bounds.size.height = %f", self.view.bounds.size.height);
    [self.view addSubview:lockView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
