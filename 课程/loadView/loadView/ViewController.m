//
//  ViewController.m
//  loadView
//
//  Created by kemchenj on 5/7/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end



@implementation ViewController

- (void)loadView
{

    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor redColor];
    self.view            = view;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSLog(@"%s", __func__);

    UIAlertController *alert         = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                           message:@"This is an alert."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction     *defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction *action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert
                       animated:YES
                     completion:nil];

    self.view.backgroundColor = [UIColor blueColor];
}

@end
