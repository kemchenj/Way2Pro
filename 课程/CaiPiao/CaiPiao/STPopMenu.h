//
//  STPopMenu.h
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>



@class STPopMenu;



@protocol STPopMenuDelegate <NSObject>

@optional
- (void)popMenuDidClickClose:(STPopMenu *)menu;

@end



@interface STPopMenu : UIView

@property (nonatomic, weak) id <STPopMenuDelegate> delegate;

+ (instancetype)popMenu;

+ (instancetype)showInPoint:(CGPoint)point;

- (void)hideInPoint:(CGPoint)point completion:(void (^)())completionBlock;

@end
