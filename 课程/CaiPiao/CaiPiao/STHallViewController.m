//
//  STHallViewController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STHallViewController.h"
#import "STCover.h"
#import "STPopMenu.h"



@interface STHallViewController () <STPopMenuDelegate>
@end



@implementation STHallViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"CS50_activity_image"]
                                                                             style:UIBarButtonItemStyleDone
                                                                            target:self
                                                                            action:@selector(activity)
    ];
}

- (void)activity;
{
    [STCover show];

    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;

    STPopMenu *menu = [STPopMenu showInPoint:CGPointMake(screenW * 0.5, screenH * 0.5)];
    menu.delegate = self;
}



#pragma mark - <STPopMenu Delegate>

- (void)popMenuDidClickClose:(STPopMenu *)menu;
{
    [menu hideInPoint:CGPointMake(44, 44)
           completion:^{
               [STCover hide];
           }
    ];
}


@end
