//
//  STNewFeatureCollectionViewCell.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STNewFeatureCollectionViewCell.h"
#import "STTabBarViewController.h"



#define STKeyWindow [UIApplication sharedApplication].keyWindow



@interface STNewFeatureCollectionViewCell ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIButton    *startButotn;

@end



@implementation STNewFeatureCollectionViewCell

- (UIButton *)startButotn;
{
    if (!_startButotn) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

        _startButotn = button;

        [button setBackgroundImage:[UIImage imageNamed:@"guideStart"]
                          forState:UIControlStateNormal
        ];

        [button sizeToFit];

        [button addTarget:self
                   action:@selector(start)
         forControlEvents:UIControlEventTouchUpInside
        ];

        [self.contentView addSubview:button];
    }

    return _startButotn;
}

- (void)start;
{
    STTabBarViewController *tabBarViewController = [[STTabBarViewController alloc] init];

    STKeyWindow.rootViewController = tabBarViewController;

    CATransition *transition = [CATransition animation];
    transition.type     = @"rippleEffect";
    transition.duration = 1;

    [STKeyWindow.layer addAnimation:transition
                             forKey:nil
    ];
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count;
{
    if (indexPath.row == count - 1) {
        self.startButotn.hidden = NO;
    } else {
        self.startButotn.hidden = YES;
    }
}

- (UIImageView *)imageView;
{
    if (!_imageView) {
        UIImageView *uiImageView = [[UIImageView alloc] init];
        _imageView = uiImageView;
        [self.contentView addSubview:uiImageView];
    }

    return _imageView;
}

- (void)setImage:(UIImage *)image;
{
    _image = image;

    self.imageView.image = image;
}

- (void)layoutSubviews;
{
    [super layoutSubviews];

    self.startButotn.center = CGPointMake(self.width * 0.5, self.height * 0.5);

    self.imageView.frame = self.bounds;
}


@end
