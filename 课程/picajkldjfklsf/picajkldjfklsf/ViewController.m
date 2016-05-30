//
//  ViewController.m
//  picajkldjfklsf
//
//  Created by kemchenj on 5/15/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (nonatomic, weak) UIView               *cover;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, assign) CGPoint            startP;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    CGPoint curP = [sender locationInView:self.view];
    if (sender.state == UIGestureRecognizerStateBegan) {
        _startP = curP;
    }

    CGFloat clipW    = curP.x - _startP.x;
    CGFloat clipH    = curP.y - _startP.y;
    CGRect  clipRect = CGRectMake(_startP.x, _startP.y, clipW, clipH);
    self.cover.frame = clipRect;

    if (sender.state == UIGestureRecognizerStateEnded) {
        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);

        UIBezierPath *path = [UIBezierPath bezierPathWithRect:clipRect];
        [path addClip];

        [self.imageView.layer renderInContext:UIGraphicsGetCurrentContext()];

        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();

        self.imageView.image = image;

        [self.cover removeFromSuperview];
    }
}

- (UIView *)cover;
{
    if (!_cover) {
        UIView *cover = [[UIView alloc] init];
        cover.alpha           = 0.6;
        cover.backgroundColor = [UIColor darkGrayColor];

        [self.view addSubview:cover];
        _cover = cover;
    }

    return _cover;
}

@end
