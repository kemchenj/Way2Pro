//
// Created by kemchenj on 5/9/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "STViewController.h"
#import "SecondViewController.h"



@interface STViewController ()


@end



@implementation STViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Root";
}

- (IBAction)jumpNext
{
    SecondViewController *secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    
    secondViewController.view.backgroundColor = [UIColor grayColor];

    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (IBAction)childController
{
    NSLog(@"%@", self.navigationController.childViewControllers);
}
@end