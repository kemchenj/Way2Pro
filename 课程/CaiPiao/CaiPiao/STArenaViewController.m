//
//  STArenaViewController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STArenaViewController.h"
#import "STArenaView.h"



#define STColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]



@interface STArenaViewController ()

@end



@implementation STArenaViewController

- (void)loadView;
{
    STArenaView *view = [[STArenaView alloc] initWithFrame:[UIScreen mainScreen].bounds];

    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"足球", @"篮球"]];

    segmentedControl.selectedSegmentIndex = 0;

    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"]
                                forState:UIControlStateNormal
                              barMetrics:UIBarMetricsDefault
    ];

    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"]
                                forState:UIControlStateSelected
                              barMetrics:UIBarMetricsDefault
    ];

    segmentedControl.tintColor = STColor(0, 142, 143);

    [segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}
                                    forState:UIControlStateSelected
    ];

    self.navigationItem.titleView = segmentedControl;
}



@end
