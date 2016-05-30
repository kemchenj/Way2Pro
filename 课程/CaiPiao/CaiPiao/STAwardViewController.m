//
//  STAwardViewController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STAwardViewController.h"
#import "STSwitchItem.h"
#import "STGroupItem.h"
#import "STSettingCell.h"



@implementation STAwardViewController

- (void)viewDidLoad;
{
    [super viewDidLoad];
    
    [self setupGroup0];
}

- (void)setupGroup0;
{
    STSwitchItem *item = [STSwitchItem itemWithIcon:nil
                                              title:@"双色球"
    ];
    item.subTitle = @"每周开奖";

    STSwitchItem *item1 = [STSwitchItem itemWithIcon:nil
                                               title:@"双色球"
    ];

    STSwitchItem *item2 = [STSwitchItem itemWithIcon:nil
                                               title:@"双色球"
    ];

    STGroupItem *group = [[STGroupItem alloc] init];

    group.items = @[item, item1, item2];

    [self.groups addObject:group];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    STSettingCell *cell = [STSettingCell cellWithTableView:tableView
                                                     style:UITableViewCellStyleSubtitle
    ];
    
    STGroupItem *group = self.groups[indexPath.section];

    STSettingItem *item = group.items[indexPath.row];

    cell.item = item;

    return cell;
}


@end
