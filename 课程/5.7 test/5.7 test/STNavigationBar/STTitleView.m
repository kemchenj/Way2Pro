//
//  NavigationBarCenter.m
//  5.7 test
//
//  Created by kemchenj on 5/7/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STTitleView.h"



@interface STTitleView ()

@property (nonatomic, assign) CGFloat buttonWidth;
@property (nonatomic, assign) CGFloat buttonHeight;
@property (nonatomic, assign) CGFloat deselectedAlpha;

@property (nonatomic, strong) UIView   *bottom;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end



@implementation STTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup:frame];
    }

    return self;
}

- (void)setup:(CGRect)frame
{
    self.deselectedAlpha = 0.1;
    self.buttonWidth     = frame.size.width / 2;
    self.buttonHeight    = frame.size.height - 2;


    // 底部导航条
    self.bottom                 = [[UIView alloc] init];
    self.bottom.backgroundColor = [UIColor darkGrayColor];
    self.bottom.frame           = CGRectMake(0, self.buttonHeight, self.buttonWidth, 2);
    [self addSubview:self.bottom];


    // 左边的"美天"按钮
    UIButton *leftButton = [[UIButton alloc] init];
    [leftButton setTitle:@"美天"
                forState:UIControlStateNormal
    ];
    [leftButton setTitleColor:[UIColor blackColor]
                     forState:UIControlStateNormal
    ];
    [leftButton addTarget:self
                   action:@selector(clickLeft)
         forControlEvents:UIControlEventTouchUpInside
    ];
    leftButton.frame = CGRectMake(0, 0, self.buttonWidth, self.buttonHeight);
    [self addSubview:leftButton];
    self.leftButton = leftButton;


    // 右边的"美辑"按钮
    UIButton *rightButton = [[UIButton alloc] init];
    [rightButton setTitleColor:[UIColor blackColor]
                      forState:UIControlStateNormal
    ];
    rightButton.alpha = self.deselectedAlpha;
    [rightButton setTitle:@"美辑"
                 forState:UIControlStateNormal
    ];
    [rightButton addTarget:self
                    action:@selector(clickRight)
          forControlEvents:UIControlEventTouchUpInside
    ];
    rightButton.frame = CGRectMake(self.buttonWidth, 0, self.buttonWidth, self.buttonHeight);
    [self addSubview:rightButton];
    self.rightButton = rightButton;


    // 接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(scrollToRight)
                                                 name:@"STScrollToRight"
                                               object:nil
    ];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(scrollToLeft)
                                                 name:@"STScrollToLeft"
                                               object:nil
    ];
}



#pragma mark - <Property>

- (void)setPercent:(float)percent
{
    _percent = percent;

    CGFloat bottomX = (int) (percent * 60);
    CGRect  frame   = self.bottom.frame;
    self.bottom.frame = CGRectMake(bottomX, frame.origin.y, frame.size.width, frame.size.height);

    self.leftButton.alpha  = (1 - (1 - _deselectedAlpha) * percent);
    self.rightButton.alpha = (percent * (1 - self.deselectedAlpha) + self.deselectedAlpha);
}



#pragma mark - <Page Tab>

- (void)scrollToRight
{
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.leftButton.alpha  = self.deselectedAlpha;
                         self.rightButton.alpha = 1;
                     }];
}

- (void)scrollToLeft
{
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.leftButton.alpha  = 1;
                         self.rightButton.alpha = self.deselectedAlpha;
                     }
    ];
}

- (void)clickLeft
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"STScrollToLeft"
                                                        object:self
    ];
}

- (void)clickRight
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"STScrollToRight"
                                                        object:self
    ];
}


@end
