//
//  ViewController.m
//  UIButton
//
//  Created by kemchenj on 4/25/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STButton.h"

@interface ViewController ()

@property(nonatomic, weak) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    STButton *btn = [[STButton alloc] init];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(50, 50, 200, 250);
    [btn setTitle:@"钱包" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"qianbao"] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    self.btn = btn;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", self.btn.subviews);
}

@end
