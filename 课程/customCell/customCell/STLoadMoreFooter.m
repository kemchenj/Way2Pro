//
//  STLoadMoreFooter.m
//  customCell
//
//  Created by kemchenj on 5/2/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STLoadMoreFooter.h"



@interface STLoadMoreFooter ()

@property(weak, nonatomic) IBOutlet UIView   *loadingView;
@property(weak, nonatomic) IBOutlet UIButton *loadMoreButton;

@end



@implementation STLoadMoreFooter

- (IBAction)loadMore
{
    self.loadMoreButton.hidden = YES;
    self.loadingView.hidden    = NO;

    if ([self.delegate respondsToSelector:@selector(loadMoreFooterDidClickLoadMoreButton:)]) {
        [self.delegate loadMoreFooterDidClickLoadMoreButton:self];
    }
}

+ (instancetype)footer
{
    return [[[NSBundle mainBundle] loadNibNamed:@"STLoadMoreFooter" owner:nil options:nil] lastObject];
}

- (void)endLoading
{
    self.loadMoreButton.hidden = NO;
    self.loadingView.hidden    = YES;
}


@end
