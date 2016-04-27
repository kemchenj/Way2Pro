//
//  STPageView.m
//  scrollView页码
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STPageView.h"

@interface STPageView()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation STPageView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.pageControl.hidesForSinglePage = YES;
    
    [self.pageControl setValue:[UIImage imageNamed:@"current"] forKey:@"_currentPageImage"];
    [self.pageControl setValue:[UIImage imageNamed:@"other"] forKey:@"_pageImage"];
    
    [self startTimer];
}

+(instancetype)pageView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

-(void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    
    // 添加新的imageView之前, 要移除之前定位的imageView, 保证能update到最新的资料而不是添加上去
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSUInteger count = imageNames.count;
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
    
    self.pageControl.numberOfPages = count;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int)(scrollView.contentOffset.x / self.scrollView.frame.size.width + 0.5);
    self.pageControl.currentPage = page;
}

-(void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage:) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)nextPage:(NSTimer *)timer
{
    NSInteger page = self.pageControl.currentPage + 1;
    if (page == 5) {
        page = 0;
    }
    
    [self.scrollView setContentOffset:CGPointMake(page*self.scrollView.frame.size.width, 0) animated:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

@end
