//
//  ViewController.m
//  UIScrollViewDelegate
//
//  Created by kemchenj on 4/26/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 添加scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.frame = CGRectMake(20, 20, 300, 200);
    [self.view addSubview:scrollView];
    
    // 2. 添加imageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [scrollView addSubview:imageView];
    
    // 3. 设置content size
    scrollView.contentSize = image.size;
    
    // 4. 设置代理
    scrollView.delegate = self;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollView did scroll");
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollView will begin dragging");
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"scrollview will end dragging");
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate == NO) {
        NSLog(@"用户已经停止拖拽scrollView,scrollView停止滚动");
    } else {
        NSLog(@"用户已经停止拖拽scrollView,但是scrollView由于惯性会继续滚动,并且减速");
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollView减速完毕,停止滚动");
}

@end
