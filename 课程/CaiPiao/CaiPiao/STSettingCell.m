//
//  STSettingCell.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STSettingCell.h"
#import "STArrowItem.h"
#import "STSwitchItem.h"
#import "STSettingItem.h"



@interface STSettingCell ()

@property (nonatomic, strong) UISwitch *switchView;

@end



@implementation STSettingCell

- (UISwitch *)switchView;
{
    if (!_switchView) {
        _switchView = [[UISwitch alloc] init];
    }

    return _switchView;
}

- (void)setItem:(STSettingItem *)item;
{
    _item = item;

    [self setupData];

    [self setupAccessoryView];
}

- (void)setupData;
{
    self.textLabel.text       = _item.title;
    self.imageView.image      = _item.icon;
    self.detailTextLabel.text = _item.subTitle;
}

- (void)setupAccessoryView;
{
    if ([_item isKindOfClass:[STArrowItem class]]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if ([_item isKindOfClass:[STSwitchItem class]]) {
        self.accessoryView = self.switchView;
    } else {
        self.accessoryView = nil;
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)cellStyle;
{
    static NSString *ID = @"cell";

    STSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (!cell) {
        cell = [[self alloc] initWithStyle:cellStyle
                           reuseIdentifier:ID
        ];
    }

    return cell;
}


@end
