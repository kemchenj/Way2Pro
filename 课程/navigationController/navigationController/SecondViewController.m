//
// Created by kemchenj on 5/9/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"



@implementation SecondViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Second";
}

- (IBAction)jumpNext:(id)sender {
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    thirdViewController.view.backgroundColor = [UIColor darkGrayColor];
    [self.navigationController pushViewController:thirdViewController animated:YES];
}

- (IBAction)rootController {
    NSLog(@"%@", self.navigationController.childViewControllers);
}
@end