//
//  ViewController.m
//  iOS体验
//
//  Created by xiaomage on 15/6/2.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageContainer;

@end

@implementation ViewController

/*
// 监听用户点击屏幕
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 告诉系统要拨打哪个电话号码
    NSURL *url = [NSURL URLWithString:@"sms://10010"];
    // 拨打电话号码
    [[UIApplication sharedApplication] openURL:url];
}
 */

/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 创建一个多度动画
    CATransition *anima = [CATransition animation];
    // 设置动画类型
    anima.type = @"cube";
    // 设置动画时间
    anima.duration = 5;
    // 添加动画
    [self.view.layer addAnimation:anima forKey:nil];
}
 */

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.将所有的图片保存起来
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 1; i <= 36; i++) {
        // 拼接所有的图片名称
        NSString *name = [NSString stringWithFormat:@"img_360car_black_%02d", i];
        [arrM addObject:[UIImage imageNamed:name]];
    }
    // 2.把图片设置给图片容器
    self.imageContainer.animationImages = arrM;
    
    self.imageContainer.animationDuration = 5;
    self.imageContainer.animationRepeatCount = 1;
    // 3.执行动画
    [self.imageContainer startAnimating];
}

@end
