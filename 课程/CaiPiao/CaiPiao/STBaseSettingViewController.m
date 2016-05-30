//
//  STBaseSettingViewController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STBaseSettingViewController.h"
#import "STSettingCell.h"
#import "STGroupItem.h"
#import "STSettingItem.h"
#import "STArrowItem.h"



@implementation STBaseSettingViewController

- (void)viewDidLoad;
{
    [super viewDidLoad];
}

- (NSMutableArray *)groups;
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    
    NSLog(@"%@", _groups);

    return _groups;
}

- (instancetype)init;
{
    return [self initWithStyle:UITableViewStyleGrouped];
}



#pragma mark - <TableView DataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    NSInteger i = self.groups.count;
    return i;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    STGroupItem *group = _groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    STSettingCell *cell = [STSettingCell cellWithTableView:tableView
                                                     style:UITableViewCellStyleValue1
    ];

    STGroupItem *group = self.groups[indexPath.section];

    STSettingItem *settingItem = group.items[indexPath.row];

    cell.item = settingItem;

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    STGroupItem *item = self.groups[section];

    return item.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
{
    STGroupItem *item = self.groups[section];

    return item.footerTitle;
}



#pragma mark - <TableView Delegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    STGroupItem *group = self.groups[indexPath.section];

    STSettingItem *item = group.items[indexPath.row];

    if (item.operationBlock) {
        item.operationBlock(indexPath);

        return;
    }

    if ([item isKindOfClass:[STArrowItem class]]) {
        STArrowItem *arrowItem = (STArrowItem *) item;

        if (arrowItem.descVcClass == nil) {
            return;
        }

        UIViewController *controller = [[arrowItem.descVcClass alloc] init];

        [self.navigationController pushViewController:controller
                                             animated:YES
        ];
    }
}


@end
