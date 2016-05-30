//
// Created by kemchenj on 5/26/16.
// Copyright (c) 2016 ST. All rights reserved.
//

#import "TitleView.h"
#import "UIButton+title.h"



@interface TitleView ()

@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) UIView         *tabIndicator;

@end



@implementation TitleView

+ (UIScrollView *)titleViewWithTabs:(NSArray *)titles isScroll:(BOOL)isScroll
{
    UIScrollView *titleView = [[UIScrollView alloc] init];

    // 配置是否滚动
    if (isScroll) {
        titleView.bounces = YES;
    }
    [self setupButtons:titles];
}

+ (void)setupButtons:(NSArray *)titles;
{
    // 处理按钮逻辑
    int count = titles.count;

    for (int i = 0; i < count; ++i) {
        NSString *title  = titles[i];
        UIButton *button = [UIButton buttonWithTitle:title
                                                 tag:i
        ];
        [button addTarget:self
                   action:@selector(switchTab:)
         forControlEvents:UIControlEventTouchUpInside
        ];
    }
}

- (void)switchTab:(UIButton *)button;
{
}

- (void)layoutSubviews;
{
    [super layoutSubviews];
}


@end