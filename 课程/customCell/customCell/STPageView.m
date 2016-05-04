//
//  STPageView.m
//  customCell
//
//  Created by kemchenj on 5/2/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STPageView.h"



@interface STPageView () <UIScrollViewDelegate>

@property(weak, nonatomic) IBOutlet UIScrollView  *scrollView;
@property(weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property(nonatomic, strong) NSTimer *timer;

@end



@implementation STPageView

+ (instancetype)pageView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"STPageView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib
{
    self.scrollView.autoresizingMask  = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;

    self.pageControl.hidesForSinglePage = YES;
    [self.pageControl setValue:[UIImage imageNamed:@"other"] forKeyPath:@"_pageImage"];
    [self.pageControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];

    [self startTimer];
}



#pragma mark - <---Pic Data Op--->

- (void)setImagesName:(NSArray *)imagesName
{
    _imagesName = imagesName;

    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    CGFloat  w = self.scrollView.frame.size.width;
    CGFloat  h = self.scrollView.frame.size.height;
    for (int i = 0; i < imagesName.count; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame            = CGRectMake(i * w, 0, w, h);
        imageView.image            = [UIImage imageNamed:imagesName[i]];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        [self.scrollView addSubview:imageView];
    }

    self.scrollView.contentSize = CGSizeMake(imagesName.count * w, 0);

    self.pageControl.numberOfPages = imagesName.count;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat  w = self.scrollView.frame.size.width;
    for (int i = 0; i < self.imagesName.count; ++i) {
        UIImageView *imageView = self.scrollView.subviews[i];

        CGRect frame = imageView.frame;

        frame.origin.x  = i * w;
        imageView.frame = frame;
    }
}



#pragma mark - <---Timer--->

- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage:) userInfo:@"123" repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [self.timer invalidate];
}

- (void)nextPage:(NSTimer *)timer
{
    NSInteger page = self.pageControl.currentPage + 1;

    if (page == self.imagesName.count) {
        page = 0;
    }

    CGPoint offset = CGPointMake(page * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}



#pragma mark - <---UIScrollView Delegate--->

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int) (scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}


@end
