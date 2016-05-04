//
//  STWineCell.h
//  购物车
//
//  Created by kemchenj on 4/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STWine;
@class STWineCell;



@protocol STWineCellDelegate <NSObject>

- (void)wineCellDidClickPlusButton:(STWineCell *)cell;
- (void)wineCellDidClickMinusButton:(STWineCell *)cell;
@end



@interface STWineCell : UITableViewCell

@property(nonatomic, strong) STWine                *wine;
@property(nonatomic, weak) id <STWineCellDelegate> delegate;
@end
