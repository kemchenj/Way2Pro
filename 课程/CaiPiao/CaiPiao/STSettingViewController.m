//
//  STSettingViewController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STSettingViewController.h"
#import "STGroupItem.h"
#import "STSettingItem.h"
#import "STArrowItem.h"
#import "STPushViewController.h"
#import "STSwitchItem.h"



@implementation STSettingViewController

- (void)viewDidLoad;
{
    [super viewDidLoad];

    self.title = @"设置";

    [self setupGroup0];

    [self setupGroup1];

    [self setupGroup2];
}

- (void)setupGroup0;
{
    STGroupItem *group = [[STGroupItem alloc] init];

    group.headerTitle = @"abc";

    STSettingItem *item = [STSettingItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"]
                                                title:@"使用兑换码"
    ];

    item.operationBlock = ^(NSIndexPath *indexPath) {
        NSLog(@"使用兑换码");
    };

    group.items = @[item];

    [self.groups addObject:group];
}

- (void)setupGroup1;
{
    STArrowItem *item = [STArrowItem itemWithIcon:[UIImage imageNamed:@"MorePush"]
                                            title:@"推送和提醒"
    ];
    item.descVcClass = [STPushViewController class];

    STSwitchItem *item1 = [STSwitchItem itemWithIcon:[UIImage imageNamed:@"MorePush"]
                                             title:@"推送和提醒"
    ];
    STArrowItem *item2 = [STArrowItem itemWithIcon:[UIImage imageNamed:@"MorePush"]
                                             title:@"推送和提醒"
    ];
    STArrowItem *item3 = [STArrowItem itemWithIcon:[UIImage imageNamed:@"MorePush"]
                                             title:@"推送和提醒"
    ];

    STGroupItem *group = [[STGroupItem alloc] init];
    group.items = @[item, item1, item2, item3];
    [self.groups addObject:group];
}

- (void)setupGroup2;
{
    STSettingItem *item = [STSettingItem itemWithIcon:[UIImage imageNamed:@"MoreUpdate"]
                                                title:@"检查新版本"
    ];
    item.operationBlock = ^(NSIndexPath *indexPath) {
        NSLog(@"已经为最新版本");
    };

    STSettingItem *item1 = [STSettingItem itemWithIcon:[UIImage imageNamed:@"MoreUpdate"]
                                                 title:@"检查新版本"
    ];
    STSettingItem *item2 = [STSettingItem itemWithIcon:[UIImage imageNamed:@"MoreUpdate"]
                                                 title:@"检查新版本"
    ];
    STSettingItem *item3 = [STSettingItem itemWithIcon:[UIImage imageNamed:@"MoreUpdate"]
                                                 title:@"检查新版本"
    ];

    STGroupItem *group = [[STGroupItem alloc] init];
    group.items       = @[item, item1, item2, item3];
    group.footerTitle = @"aaaa";
    [self.groups addObject:group];
}

@end
