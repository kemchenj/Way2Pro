//
//  ViewController.m
//  contentButton
//
//  Created by kemchenj on 4/26/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageView];
    
    self.scrollView.contentSize = image.size;
    self.scrollView.contentOffset = CGPointMake(0, -80);
    self.scrollView.contentInset = UIEdgeInsetsMake(100, 100, 100, 100);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.scrollView.contentOffset = CGPointMake(-100, -100);
}

-(IBAction)top
{
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 0) animated:YES];
}

-(IBAction)bottom
{
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat offsetY = self.scrollView.contentSize.height - self.scrollView.frame.size.height;
    
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.scrollView setContentOffset:offset animated:YES];
}

-(IBAction)left
{
    [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y) animated:YES];
}

-(IBAction)right
{
    CGFloat offsetY = self.scrollView.contentOffset.y;
    CGFloat offsetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.scrollView setContentOffset:offset animated:YES];
}

@end
