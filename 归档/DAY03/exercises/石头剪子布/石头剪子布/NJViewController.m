//
//  ViewController.m
//  石头剪子布
//
//  Created by 李南江 on 14-2-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface NJViewController ()
{
    NSArray *array;
    
    // 背景音乐播放器
    AVAudioPlayer *_player;
    
    // 胜利
    SystemSoundID _successedSoundId;
    // 失败
    SystemSoundID _faildSoundId;
    // 和局
    SystemSoundID _drewSoundId;
    // 单击按钮
    SystemSoundID _clickSoundId;
}

@end

@implementation NJViewController
/**
 山哥提示：
 1. 让电脑动态图片和玩家动态图片实现序列帧动画
 2. 把提示标签隐藏
 3. 按钮点击处理——玩家出拳
 4. 判断出结果之后，需要停止序列帧动画，否则玩家看不到及时的结果！
 5. 把出拳的视图隐藏，显示继续按钮，继续按钮点击之后，重新开始游戏
 
 6. 播放背景音乐
 6.1 初始化播放器
 6.2 开始播放
 
 7. 处理音效
 7.1 音效的类型是一个SystemSound的类型
 7.2 初始化音效
 */

// 加载音效文件
- (SystemSoundID)loadSound:(NSString *)soundName
{
    NSURL *url = [[NSBundle mainBundle]URLForResource:soundName withExtension:nil];
    
    // 创建声音Id
    SystemSoundID soundId;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &soundId);
    
    return soundId;
}

- (AVAudioPlayer *)loadMusicPlayer:(NSString *)fileName
{
    NSURL *url = [[NSBundle mainBundle]URLForResource:fileName withExtension:nil];
    AVAudioPlayer *player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    
    // 重复次数，默认自己会播放一次
    [player setNumberOfLoops:-1];
    
    // 准备就绪，对于大音频文件，需要做准备工作
    [player prepareToPlay];
    
    return player;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 序列帧动画的建立
    // 1. 初始化一个数组
    UIImage *image1 = [UIImage imageNamed:@"石头"];
    image1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image2 = [UIImage imageNamed:@"剪刀"];
    image2 = [image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image3 = [UIImage imageNamed:@"布"];
    image3 = [image3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    array = @[image1,image2,
                       image3];
    // 2. 设置序列帧动画数组
    [_computerImage setAnimationImages:array];
    [_playerImage setAnimationImages:array];
    // 3. 设置时长
    [_computerImage setAnimationDuration:1.0];
    [_playerImage setAnimationDuration:1.0];
    // 4. 启动动画
    [_computerImage startAnimating];
    [_playerImage startAnimating];
    
    // 把游戏提示标签隐藏
    [_tipLabel setText:@""];
    
    // 播放音乐
    _player = [self loadMusicPlayer:@"背景音乐.caf"];
    [_player setVolume:0.2];
    [_player play];
    
    // 加载音效
    _successedSoundId = [self loadSound:@"胜利.aiff"];
    _faildSoundId = [self loadSound:@"失败.aiff"];
    _drewSoundId = [self loadSound:@"和局.aiff"];
    _clickSoundId = [self loadSound:@"点击按钮.aiff"];
    
    [_resumeButton setEnabled:NO];
}


// 玩家出拳
- (IBAction)playAction:(id)sender
{
    AudioServicesPlaySystemSound(_clickSoundId);
    
    // A.用户出拳的时候，我们可以停止动画
    [_playerImage stopAnimating];
    [_computerImage stopAnimating];
    
    // 用户选择一个按钮，我们通过tag可以知道选择了哪个按钮
    // 让电脑随机一个数值，跟用户选择的结果进行比较
    // 根据比较结果提示用户游戏信息……
    // 石头 0
    // 剪刀 1
    // 布 2
    NSInteger playerSelect = [sender tag];
    NSInteger computerSelect = arc4random() % 3;
    
    // B.计算机出拳后，需要显示对应的图片
    [_playerImage setImage:array[playerSelect]];
    [_computerImage setImage:array[computerSelect]];
    
    /*
    NSInteger result = playerSelect - computerSelect;
    
    // 1). result = 0，表示出拳一样
    // 2). result = 1 或者 result = -2 说明玩家输了
    // 3). 其他的情况，玩家赢了 -1 或者 2
    
    NSString *string;
    if (result == 0) {
        // 和
        string = @"和局";
        AudioServicesPlaySystemSound(_drewSoundId);
    } else if (result == 1 || result == -2) {
        // 电脑赢
        string = @"真可惜，你输了！";
        AudioServicesPlaySystemSound(_faildSoundId);
    } else {
        // 玩家赢
        string = @"你真棒！";
        AudioServicesPlaySystemSound(_successedSoundId);
    }
    */
    
    NSString *string;
//    5.判断比赛结果
//    山哥提示：此处和C语言中学习的一样
    if ((playerSelect == 0 && computerSelect == 1) ||
        (playerSelect == 1 && computerSelect == 2) ||
        (playerSelect == 2 && computerSelect == 0)) {
        //        5.1玩家胜利
        string = @"你真棒！";
        
//        播放胜利音效
        AudioServicesPlaySystemSound(_successedSoundId);
        // 1. 获取玩家标签的文本，并且转换成数字
        NSInteger playerScore = [_playerScoreLabel.text integerValue];
        // 2. 将数字+1
        playerScore++;
        // 3. 重新设置标签文本
        [_playerScoreLabel setText:[NSString stringWithFormat:@"%ld", playerScore]];
        
    }else if (computerSelect ==  playerSelect)
    {
        //        5.3平局
        string = @"和局";
        AudioServicesPlaySystemSound(_drewSoundId);
    
    }else{
        //        5.2电脑胜利
        string = @"真可惜，你输了！";
        AudioServicesPlaySystemSound(_faildSoundId);
        NSInteger computerScore = [_computerScoreLabel.text integerValue];
        computerScore++;
        [_computerScoreLabel setText:[NSString stringWithFormat:@"%ld", computerScore]];
    }
    [_tipLabel setText:string];
    
    // 隐藏出拳视图
//    [_actionView setHidden:YES];
    // 通过设置边框，来实现按钮的动画效果

    [_resumeButton setFrame:CGRectMake(160.0, 410.0, 0.0, 0.0)];
    [_resumeButton setAlpha:0.0f];
    
    [_actionView setUserInteractionEnabled:NO];
    [UIView animateWithDuration:0.5f animations:^{
        // 隐藏出拳视图
        [_actionView setCenter:CGPointMake(_actionView.center.x, +_actionView.center.y + 100.0)];
    } completion:^(BOOL finished) {
        // 显示继续按钮
        [UIView animateWithDuration:0.2f animations:^{
            [_resumeButton setFrame:CGRectMake(110.0, 360.0, 100.0, 100.0)];
            [_resumeButton setAlpha:1.0f];
        } completion:^(BOOL finished) {
            [_resumeButton setEnabled:YES];
        }];
    }];
}

- (IBAction)resumeGame:(id)sender
{
    AudioServicesPlaySystemSound(_clickSoundId);
    
    [_resumeButton setEnabled:NO];
    
    // 1. 重新启动序列帧动画
    [_computerImage startAnimating];
    [_playerImage startAnimating];
    
    // 2. 清空提示文字
    [_tipLabel setText:@""];
    
    // 3. 显示出拳视图
//    [_actionView setHidden:NO];
    [UIView animateWithDuration:0.2F animations:^{
        [_actionView setCenter:CGPointMake(_actionView.center.x, +_actionView.center.y - 100.0)];
    } completion:^(BOOL finished) {
        [_actionView setUserInteractionEnabled:YES];
    }];

}
@end
