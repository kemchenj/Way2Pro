//
//  STHandleImageView.m
//  freepaint
//
//  Created by kemchenj on 5/16/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STHandleImageView.h"



@interface STHandleImageView () <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIImageView *view;

@end



@implementation STHandleImageView

- (UIImageView *)imageView;
{
    if (!_imageView) {
        UIImageView *view = [[UIImageView alloc] init];

        _imageView = view;

        _imageView.userInteractionEnabled = YES;

        [self addSubview:_imageView];

        [self addGesture];
    }


    return _imageView;
}

- (void)addGesture;
{
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(pan:)];
    [_imageView addGestureRecognizer:gestureRecognizer];

    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                                                                 action:@selector(pinch:)];
    [_imageView addGestureRecognizer:pinchGestureRecognizer];

    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                                             action:@selector(longPress:)];
    [_imageView addGestureRecognizer:longPressGestureRecognizer];

    UIRotationGestureRecognizer *uiRotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                                                            action:@selector(rotate:)];
    uiRotationGestureRecognizer.delegate = self;
    [_imageView addGestureRecognizer:uiRotationGestureRecognizer];
}

- (void)setImage:(UIImage *)image;
{
    _image = image;

    self.imageView.image = image;
    self.imageView.frame = self.bounds;
}

- (void)pan:(UIPanGestureRecognizer *)pan;
{
    CGPoint point = [pan translationInView:_imageView];
    _imageView.transform = CGAffineTransformTranslate(_imageView.transform, point.x, point.y);

    [pan setTranslation:CGPointZero
                 inView:_imageView
    ];
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch;
{
    _imageView.transform = CGAffineTransformScale(_imageView.transform, pinch.scale, pinch.scale);
    pinch.scale          = 1;
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress;
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.25
                         animations:^{
                             _imageView.alpha = 0.0;
                         }
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.25
                                              animations:^{
                                                  _imageView.alpha = 1;
                                              }
                                              completion:^(BOOL finished) {
                                                  UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
                                                  [self.layer renderInContext:UIGraphicsGetCurrentContext()];

                                                  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

                                                  UIGraphicsEndImageContext();

                                                  [[NSNotificationCenter defaultCenter] postNotificationName:@"handleImage"
                                                                                                      object:nil
                                                                                                    userInfo:@{
                                                                                                            @"image" : image
                                                                                                    }
                                                  ];
                                              }
                             ];
                         }
        ];
    }
}

- (void)rotate:(UIRotationGestureRecognizer *)rotate;
{
    _imageView.transform = CGAffineTransformRotate(_imageView.transform, rotate.rotation);
    rotate.rotation      = 0;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;
{
    return YES;
}


@end
