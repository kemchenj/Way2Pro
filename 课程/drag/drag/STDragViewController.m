//
//  STDragViewController.m
//  drag
//
//  Created by kemchenj on 5/13/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STDragViewController.h"



#define maxY (200)
#define screenW ([UIScreen mainScreen].bounds.size.width)
#define leftTargetX (-250)
#define rightTargetX (300)



@interface STDragViewController ()

@end



@implementation STDragViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupChildView];
    [self setupPanGesture];
    [self setupKVO];
}

- (void)setupKVO
{
    [self.mainView addObserver:self
                    forKeyPath:@"frame"
                       options:NSKeyValueObservingOptionNew
                       context:nil
    ];
}

- (void)setupChildView
{
    UIView *leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    leftView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:leftView];
    self.leftView = leftView;

    UIView *rightView = [[UIView alloc] initWithFrame:self.view.bounds];
    rightView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:rightView];
    self.rightView = rightView;

    UIView *mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor grayColor];
    self.mainView            = mainView;

    [self.view addSubview:mainView];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (_mainView.frame.origin.x > 0) {
        _rightView.hidden = YES;
    } else if (_mainView.frame.origin.x < 0) {
        _rightView.hidden = NO;
    }
}



#pragma mark - <Pan Thing>

- (void)setupPanGesture
{
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_mainView addGestureRecognizer:panGestureRecognizer];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGFloat offsetX = [pan translationInView:_mainView].x;
    _mainView.frame = [self frameWithOffsetX:offsetX];
    [pan setTranslation:CGPointZero inView:_mainView];
    if (pan.state == UIGestureRecognizerStateEnded) {
        NSLog(@"手指抬起");
        CGFloat target = 0;
        if (_mainView.frame.origin.x > screenW * 0.5) {
            target = rightTargetX;
        } else if (CGRectGetMaxX(_mainView.frame) < screenW * 0.5) {
            target = leftTargetX;
        }

        CGFloat offsetX = target - _mainView.frame.origin.x;

        [UIView animateWithDuration:0.25 animations:^{
            _mainView.frame = [self frameWithOffsetX:offsetX];
        }];
    }
}

- (CGRect)frameWithOffsetX:(CGFloat)offsetX
{
    CGFloat screenH = [[UIScreen mainScreen] bounds].size.height;

    CGRect frame = _mainView.frame;
    frame.origin.x += offsetX;

    CGFloat x = frame.origin.x;
    CGFloat y = (CGFloat) fabs(x / screenW * maxY);
    CGFloat h = screenH - 2 * y;
    CGFloat w = screenW * (h / screenH);

    return CGRectMake(x, y, w, h);
}

@end
