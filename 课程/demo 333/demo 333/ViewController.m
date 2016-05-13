//
//  ViewController.m
//  demo 333
//
//  Created by kemchenj on 5/6/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *right;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom;
@property (nonatomic, assign) BOOL status;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)test:(id)sender {
    if (self.status) {
        [UIView animateWithDuration:0.4 animations:^{
            self.imageView.alpha = 0.5;
            self.top.constant = 100;
            self.bottom.constant = 350;
            self.right.constant = 130;
            self.left.constant = 130;
            [self.view layoutIfNeeded];
        }];
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            self.imageView.alpha = 1;
            self.top.constant = 0;
            self.bottom.constant = 0;
            self.right.constant = 0;
            self.left.constant = 0;
            [self.view layoutIfNeeded];
        }];
    }
    self.status = !self.status;
}

@end
