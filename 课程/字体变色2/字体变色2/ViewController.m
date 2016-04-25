//
//  ViewController.m
//  字体变色2
//
//  Created by kemchenj on 4/18/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickRed{
    _label.textColor = [UIColor redColor];
}

-(IBAction)clickGreen{
    _label.textColor = [UIColor greenColor];
}

-(IBAction)clickBlack{
    _label.textColor = [UIColor blackColor];
}

@end
