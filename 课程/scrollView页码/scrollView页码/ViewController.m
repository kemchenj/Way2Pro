//
//  ViewController.m
//  scrollView页码
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STPageView.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    STPageView *pageView = [STPageView pageView];
    pageView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.0];
    pageView.center = CGPointMake(210, 150);
    pageView.imageNames = @[@"img_01",@"img_02",@"img_03",@"img_04",@"img_05"];
    [self.view addSubview:pageView];
}


@end
