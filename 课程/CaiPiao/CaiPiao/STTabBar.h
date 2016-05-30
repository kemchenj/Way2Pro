//
//  STTabBar.h
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>



@class STTabBar;



@protocol STTabBarDelegate <NSObject>

@optional
- (void)tabBar:(STTabBar *)tabBar didClickButton:(NSInteger)index;

@end



@interface STTabBar : UIView

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, weak) id<STTabBarDelegate> delegate;

@end
