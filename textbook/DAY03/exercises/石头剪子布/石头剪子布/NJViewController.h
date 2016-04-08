//
//  ViewController.h
//  石头剪子布
//
//  Created by 李南江 on 14-2-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NJViewController : UIViewController

// 电脑动态图片
@property (weak, nonatomic) IBOutlet UIImageView *computerImage;
// 玩家动态图片
@property (weak, nonatomic) IBOutlet UIImageView *playerImage;
// 游戏提示标签
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

// 出拳视图
@property (weak, nonatomic) IBOutlet UIView *actionView;
// 继续按钮
@property (weak, nonatomic) IBOutlet UIButton *resumeButton;
// 计算机得分标签
@property (weak, nonatomic) IBOutlet UILabel *computerScoreLabel;
// 玩家得分标签
@property (weak, nonatomic) IBOutlet UILabel *playerScoreLabel;
// 玩家出拳
- (IBAction)playAction:(id)sender;

// 继续游戏
- (IBAction)resumeGame:(id)sender;

@end
