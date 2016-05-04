//
//  STLoadMoreFooter.h
//  customCell
//
//  Created by kemchenj on 5/2/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STLoadMoreFooter;



@protocol STLoadMoreFooterDelegate <NSObject>

- (void)loadMoreFooterDidClickLoadMoreButton:(STLoadMoreFooter *)loadMoreFooter;

@end



@interface STLoadMoreFooter : UIView

@property (nonatomic, weak) id<STLoadMoreFooterDelegate> delegate;

+ (instancetype) footer;
- (void)endLoading;

@end
