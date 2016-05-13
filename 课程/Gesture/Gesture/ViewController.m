//
//  ViewController.m
//  Gesture
//
//  Created by kemchenj on 5/13/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end



@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupImageView];

    [self setupPan];
    [self setupTap];
    [self setupSwipe];
    [self setupPinch];
    [self setupLongPress];
    [self setupRotationGesture];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)setupImageView
{
    self.imageView   = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minion"]];
    _imageView.frame = CGRectMake(100, 200, 280, 200);
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
}



#pragma mark - <Rotation Thing>

- (void)setupRotationGesture
{
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotationGestureRecognizer.delegate = self;
    [self.imageView addGestureRecognizer:rotationGestureRecognizer];
}

- (void)rotation:(UIRotationGestureRecognizer *)rotationGestureRecognizer
{
    NSLog(@"%f", rotationGestureRecognizer.rotation);
    self.imageView.transform           = CGAffineTransformRotate(self.imageView.transform, rotationGestureRecognizer.rotation);
    rotationGestureRecognizer.rotation = 0;
}



#pragma mark - <Pinch Thing>

- (void)setupPinch
{
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinchGestureRecognizer.delegate = self;
    [self.imageView addGestureRecognizer:pinchGestureRecognizer];
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch
{
    NSLog(@"%f", pinch.scale);
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinch.scale,
                                                      pinch.scale);

    pinch.scale = 1;
}



#pragma mark - <Pan Thing>

- (void)setupPan
{
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];

    [self.imageView addGestureRecognizer:panGestureRecognizer];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint transP = [pan translationInView:self.imageView];

    NSLog(@"%@", NSStringFromCGPoint(transP));
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, transP.x,
                                                          transP.y);

    [pan setTranslation:CGPointZero inView:self.imageView];
}



#pragma mark - <Swipe Thing>

- (void)setupSwipe
{
    UISwipeGestureRecognizer *swipeGestureRecognizerUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeGestureRecognizerUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.imageView addGestureRecognizer:swipeGestureRecognizerUp];

    UISwipeGestureRecognizer *swipeGestureRecognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeGestureRecognizerDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.imageView addGestureRecognizer:swipeGestureRecognizerDown];
}

- (void)swipe:(UISwipeGestureRecognizer *)swipe
{
    if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"下");
    } else {
        NSLog(@"上");
    }
    NSLog(@"%s", __func__);
}



#pragma mark - <LongPress Thing>

- (void)setupLongPress
{
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer
            alloc] initWithTarget:self action:@selector(longPress:)];
    [self.imageView addGestureRecognizer:longPressGestureRecognizer];
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"longPress.state = %d", longPress.state);
    }
}



#pragma mark - <Tap Thing>

- (void)setupTap
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGestureRecognizer.delegate = self;

    [self.imageView addGestureRecognizer:tapGestureRecognizer];
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    NSLog(@"%s", sel_getName(_cmd));
}

@end
