//
//  STTabBar.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STTabBar.h"
#import "STTabBarButton.h"



@interface STTabBar ()

@property (nonatomic, weak) UIButton *selectedButton;

@end



@implementation STTabBar

- (void)setItems:(NSArray *)items;
{
    _items = items;

    for (int i = 0; i < items.count; ++i) {
        UITabBarItem *item = items[i];

        STTabBarButton *button = [STTabBarButton buttonWithType:UIButtonTypeCustom];

        button.tag = i;

        [button setBackgroundImage:item.image
                          forState:UIControlStateNormal
        ];
        [button setBackgroundImage:item.selectedImage
                          forState:UIControlStateSelected
        ];
        [button addTarget:self
                   action:@selector(buttonClick:)
         forControlEvents:UIControlEventTouchDown
        ];

        if (i == 0) {
            [self buttonClick:button];
        }

        [self addSubview:button];
    }
}

- (void)buttonClick:(UIButton *)button;
{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;

    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}

- (void)layoutSubviews;
{
    [super layoutSubviews];

    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = self.width / _items.count;
    CGFloat buttonH = self.height;

    NSLog(@"items.count = %d", _items.count);
    for (int i = 0; i < _items.count; ++i) {
        STTabBarButton *button = self.subviews[i];
        buttonX = i * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}


@end
