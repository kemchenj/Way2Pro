//
//  STSettingCell.h
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>



@class STSettingItem;



@interface STSettingCell : UITableViewCell

@property (nonatomic, strong) STSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)cellStyle;

@end
