//
//  ViewController.m
//  全景看车
//
//  Created by 李南江 on 15/6/1.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageContainer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 1.定义容器保存所有图片
    NSMutableArray *arrM = [NSMutableArray array];
    // 2.加载所有图片
    for (int i = 1; i <= 36; i++) {
        NSString *imageName = [NSString stringWithFormat:@"img_360car_black_%02d", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [arrM addObject:image];
    }
    // 3.将图片设置给图片容器
    self.imageContainer.animationImages = arrM;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.设置动画时长
    self.imageContainer.animationDuration = 5;
    // 2.设置动画重复次数
    self.imageContainer.animationRepeatCount = 1;
    // 3.开始动画
    [self.imageContainer startAnimating];
}

@end
