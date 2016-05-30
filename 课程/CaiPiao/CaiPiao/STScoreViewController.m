//
//  STScoreViewController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STScoreViewController.h"
#import "STSwitchItem.h"
#import "STGroupItem.h"



@interface STScoreViewController ()

@end



@implementation STScoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup2];
    [self setupGroup2];
    [self setupGroup2];
}

- (void)setupGroup2;
{
    STSwitchItem *item = [STSwitchItem itemWithIcon:nil
                                              title:@"结束时间"
    ];

    item.subTitle = @"23:59";

    __weak typeof(self) weakSelf = self;

    item.operationBlock = ^(NSIndexPath *indexPath){
        UITextField *textField = [[UITextField alloc] init];

        [textField becomeFirstResponder];

        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];

        [cell addSubview:textField];
    };

    STGroupItem *group = [[STGroupItem alloc] init];
    group.items = @[item];
    [self.groups addObject:group];
}

- (void)setupGroup1;
{
    STSwitchItem *item = [STSwitchItem itemWithIcon:nil
                                              title:@"起始时间"
    ];

    item.subTitle = @"00:00";

    STGroupItem *group1 = [[STGroupItem alloc] init];

    group1.items = @[item];
    [self.groups addObject:group1];
}

- (void)setupGroup0;
{
    STSwitchItem *item = [STSwitchItem itemWithIcon:nil
                                              title:@"推送关注的比赛"
    ];

    STGroupItem *group0 = [[STGroupItem alloc] init];

    group0.items = @[item];
    [self.groups addObject:group0];
}

- (void)dealloc;
{
    NSLog(@"%s", sel_getName(_cmd));
}


@end
