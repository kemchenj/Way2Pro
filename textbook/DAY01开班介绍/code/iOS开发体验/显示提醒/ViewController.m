//
//  ViewController.m
//  显示提醒
//
//  Created by 李南江 on 15/6/1.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.创建过度动画
    CATransition *anima = [CATransition animation];
    // 2.设置动画类型
    anima.type = @"cube";
    anima.subtype = kCATransitionFromRight;
    // 3.设置动画时间
    anima.duration = 3;
    // 4.添加动画
    [self.view.layer addAnimation:anima forKey:nil];
}
@end
