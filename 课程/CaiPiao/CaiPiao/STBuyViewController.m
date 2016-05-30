//
//  STBuyViewController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STBuyViewController.h"

@interface STBuyViewController()

@property (nonatomic, weak) UIButton *titleButton;

@end

@implementation STBuyViewController

- (IBAction)buttonClick:(id)sender
{
    [_titleButton setImage:nil
                  forState:UIControlStateNormal
    ];
}

- (void)viewDidLoad;
{
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    [button setImage:[UIImage imageNamed:@"YellowDownArrow@"]
            forState:UIControlStateNormal
    ];

    [button setTitle:@"全部采种"
            forState:UIControlStateNormal
    ];

    _titleButton = button;

    self.navigationItem.titleView = button;
}


@end
