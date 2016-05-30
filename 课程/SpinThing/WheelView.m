//
//  WheelView.m
//  SpinThing
//
//  Created by kemchenj on 5/18/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "WheelView.h"



@interface WheelView ()

@property (weak, nonatomic) IBOutlet UIImageView *wheelView;
@property (nonatomic, strong) UIButton           *selectedButotn;
@property (nonatomic, weak) CADisplayLink        *link;

@end



@implementation WheelView

- (void)awakeFromNib;
{
    self.wheelView.userInteractionEnabled = YES;

    CGFloat angle = 0;

    for (int i = 0; i < 12; ++i) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGSize   size    = self.wheelView.bounds.size;

        [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected.png"]
                          forState:UIControlStateSelected
        ];

        button.bounds            = CGRectMake(0, 0, 68, 143);
        button.layer.anchorPoint = CGPointMake(0.5, 1);
        button.layer.position    = CGPointMake(size.width * 0.5, size.height * 0.5);

        [self.wheelView addSubview:button];

        button.transform = CGAffineTransformMakeRotation(angle * M_PI / 180.0);

        angle += 30;

        [button addTarget:self
                   action:@selector(buttonClick:)
         forControlEvents:UIControlEventTouchUpInside
        ];

        if (i == 0) {
            [self buttonClick:button];
        }
    }
}

- (void)buttonClick:(UIButton *)button;
{
    self.selectedButotn.selected = NO;

    button.selected = YES;

    self.selectedButotn = button;
}

- (void)start
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath     = @"transform.rotation";
    animation.toValue     = @(M_PI * 2);
    animation.repeatCount = HUGE;
    animation.duration    = 2.0;

    [self.wheelView.layer addAnimation:animation
                                forKey:nil
    ];
}

- (void)pause
{
}

+ (instancetype)wheelView;
{
    return nil;
}


@end
