//
//  ViewController.m
//  图像拉伸
//
//  Created by kemchenj on 4/26/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ResizingImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 创建图片
//    UIImage *image = [UIImage imageNamed:@"buttongreen"];
//    // 可拉伸的图片(告诉那些地方是需要拉伸的(默认是平铺)
//    UIImage *resizingIamge = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
//    
//    [self.btn setBackgroundImage:resizingIamge forState:UIControlStateNormal];
    
   
    // 创建图片
//    UIImage *image = [UIImage imageNamed:@"chat"];
//    // 找到可以拉伸的区域
//    CGFloat imageW = image.size.width;
//    CGFloat imageH = image.size.height;
//    // 可拉伸的图片(告诉那些地方是需要拉伸的
//    UIImage *resizingIamge = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH * 0.5, imageW * 0.5, imageH * 0.5 - 1 , imageW * 0.5 - 1) resizingMode:UIImageResizingModeTile];
  
    
    /*
    // 创建图片
    UIImage *image = [UIImage imageNamed:@"chat"];
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    //  1 =  width - leftCapWidth - right
    //  1 =  height - topCapWidth - bottom
    UIImage *resizingIamge = [image stretchableImageWithLeftCapWidth:imageW * 0.5 topCapHeight:imageH * 0.5];
     */
    
//    [self.btn setBackgroundImage:[UIImage resizingImageWithImageName:@"chat"] forState:UIControlStateNormal];
    
//    [self.btn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
