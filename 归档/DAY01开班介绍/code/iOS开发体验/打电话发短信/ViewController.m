//
//  ViewController.m
//  打电话发短信
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
//    NSURL *url = [NSURL URLWithString:@"tel://10010"];
    NSURL *url = [NSURL URLWithString:@"sms://10010"];
    [[UIApplication sharedApplication] openURL:url];
}
@end
