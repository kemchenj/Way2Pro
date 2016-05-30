//
//  BadgeView.m
//  qq
//
//  Created by kemchenj on 5/20/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "BadgeView.h"



@interface BadgeView ()

@property (nonatomic, weak) UIView       *smallCircleView;
@property (nonatomic, weak) CAShapeLayer *shapeLayer;

@end



@implementation BadgeView

- (CAShapeLayer *)shapeLayer;
{
    if (!_shapeLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];

        shapeLayer.fillColor = [UIColor redColor].CGColor;

        [self.superview.layer insertSublayer:shapeLayer
                                     atIndex:0
        ];

        self.shapeLayer = shapeLayer;
    }

    return _shapeLayer;
}

- (instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }

    return self;
}

- (void)awakeFromNib;
{
    [self setup];
}

- (void)setup;
{
    self.layer.cornerRadius = self.bounds.size.width * 0.5;
    self.backgroundColor    = [UIColor redColor];

    [self setTitleColor:[UIColor whiteColor]
               forState:UIControlStateNormal
    ];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(pan:)
    ];

    [self addGestureRecognizer:pan];

    UIView *smallCircleView = [[UIView alloc] init];
    smallCircleView.frame              = self.frame;
    smallCircleView.backgroundColor    = self.backgroundColor;
    smallCircleView.layer.cornerRadius = self.layer.cornerRadius;

    [self.superview insertSubview:smallCircleView
                     belowSubview:self
    ];

    self.smallCircleView = smallCircleView;
}

- (void)pan:(UIPanGestureRecognizer *)pan;
{
    //CGPoint transP = [pan translationInView:pan.view];
    //
    //CGPoint center = self.center;
    //NSLog(@"center.x = %f", center.x);
    //NSLog(@"center.y = %f", center.y);
    //center.x += transP.x;
    //center.y += transP.y;
    //
    //self.center = center;
    //NSLog(@"center.x = %f", center.x);
    //NSLog(@"center.y = %f", center.y);
    //
    //[pan setTranslation:CGPointZero
    //             inView:pan.view
    //];
    //
    //CGFloat distance = [self distanceWithSmallCircleView:_smallCircleView
    //                                             bigView:self
    //];
    //
    //CGFloat smallR = self.bounds.size.width * 0.5 - distance / 10.0;
    //
    //_smallCircleView.bounds             = CGRectMake(0, 0, smallR * 2, smallR * 2);
    //_smallCircleView.layer.cornerRadius = smallR;
    //
    //UIBezierPath *path = [self pathWithSmallView:_smallCircleView
    //                                     bigView:self
    //];
    //
    //if (!self.smallCircleView.isHidden) {
    //    self.shapeLayer.path = path.CGPath;
    //}
    //
    //if (distance > 60.0) {
    //    self.smallCircleView.hidden = YES;
    //    [self.shapeLayer removeFromSuperlayer];
    //}
    //
    //if (pan.state == UIGestureRecognizerStateEnded) {
    //    if (distance < 60) {
    //        [self.shapeLayer removeFromSuperlayer];
    //        [UIView animateWithDuration:0.25
    //                              delay:0
    //             usingSpringWithDamping:0.3
    //              initialSpringVelocity:0
    //                            options:UIViewAnimationOptionCurveLinear
    //                         animations:^{
    //                             self.center = self.smallCircleView.center;
    //                         }
    //                         completion:^(BOOL finished) {
    //                             self.smallCircleView.hidden = NO;
    //                         }
    //        ];
    //    } else {
    //        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    //
    //        NSLog(@"imageView.frame.origin.x = %f", imageView.frame.origin.x);
    //        NSLog(@"imageView.frame.origin.y = %f", imageView.frame.origin.y);
    //
    //        NSMutableArray *array = [NSMutableArray array];
    //
    //        for (int i = 1; i < 9; ++i) {
    //            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", i]];
    //            [array addObject:image];
    //        }
    //
    //        imageView.animationImages   = array;
    //        imageView.animationDuration = 0.8;
    //        [imageView startAnimating];
    //
    //        [self addSubview:imageView];
    //
    //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    //            [self removeFromSuperview];
    //        });
    //
    //        NSLog(@"self.bounds.origin.x = %f", self.bounds.origin.x);
    //        NSLog(@"self.bounds.origin.y = %f", self.bounds.origin.y);
    //    }
    //}
    CGPoint transP = [pan translationInView:pan.view];
    //NSLog(@"%@",NSStringFromCGPoint(self.center));
    //平移
    //frame,center,transform
    //transform它并没有去修改center.
    //self.transform = CGAffineTransformTranslate(pan.view.transform, transP.x, transP.y);

    CGPoint center = self.center;
    center.x += transP.x;
    center.y += transP.y;
    self.center    = center;
    //NSLog(@"%@",NSStringFromCGPoint(self.center));

    //复位
    [pan setTranslation:CGPointZero
                 inView:pan.view];

    //求两个圆之间距离
    CGFloat distance = [self distanceWithSmallCircleView:self.smallCircleView
                                           bigView:self];
    //NSLog(@"distance=%f",distance);

    //获取小圆的半径
    //CGFloat smallR =  self.smallCircleView.bounds.size.width * 0.5;
    CGFloat smallR = self.bounds.size.width * 0.5;
    smallR = smallR - distance / 10.0;

    //更新小圆的宽度,高度.
    self.smallCircleView.bounds             = CGRectMake(0, 0, smallR * 2, smallR * 2);
    self.smallCircleView.layer.cornerRadius = smallR;

    ////给定两个圆描述一个不规则的路径
    UIBezierPath *path = [self pathWithSmallView:self.smallCircleView
                                         bigView:self];
    if (!self.smallCircleView.hidden) {
        self.shapeLayer.path = path.CGPath;
    }

    //当两个圆之间的距离大于某个值时,小圆和形状消失
    if (distance > 60.0) {
        self.smallCircleView.hidden = YES;
        [self.shapeLayer removeFromSuperlayer];
    }

    //判断手指松开
    if (pan.state == UIGestureRecognizerStateEnded) {

        if (distance < 60) {
            [self.shapeLayer removeFromSuperlayer];
            //没有大于60,复位
            [UIView animateWithDuration:0.25
                                  delay:0
                 usingSpringWithDamping:0.3
                  initialSpringVelocity:0
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                                 self.center = self.smallCircleView.center;
                             }
                             completion:^(BOOL finished) {
                                 //显示小圆
                                 self.smallCircleView.hidden = NO;
                             }];
        } else {
            //如果说大于60,做一个动画消失
            //创建ImageV
            UIImageView    *imageV     = [[UIImageView alloc] initWithFrame:self.bounds];

            NSLog(@"self.bounds.origin.x = %f", self.bounds.origin.x);
            NSLog(@"self.bounds.origin.y = %f", self.bounds.origin.y);

            //加载图片
            NSMutableArray *imageArray = [NSMutableArray array];

            for (int i = 1; i < 9; ++i) {
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",
                                                                                i]];
                [imageArray addObject:image];
            }

            //设置动画图片
            imageV.animationImages   = imageArray;
            imageV.animationDuration = 1.0;
            [imageV startAnimating];

            [self addSubview:imageV];
            //1秒钟之后,按钮消失
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self removeFromSuperview];
            });
        }
    }
}

- (UIBezierPath *)pathWithSmallView:(UIView *)smallCircleView bigView:(BadgeView *)bigCircleView;
{
    CGFloat x1 = smallCircleView.center.x;
    CGFloat y1 = smallCircleView.center.y;
    CGFloat r1 = smallCircleView.bounds.size.width * 0.5;

    CGFloat x2 = bigCircleView.center.x;
    CGFloat y2 = bigCircleView.center.y;
    CGFloat r2 = bigCircleView.bounds.size.width * 0.5;

    CGFloat distance = [self distanceWithSmallCircleView:smallCircleView
                                          bigView:bigCircleView
    ];

    if (distance <= 0) {
        NSLog(@"test");
        return nil;
    }

    CGFloat cos0 = (y2 - y1) / distance;
    CGFloat sin0 = (x2 - x1) / distance;

    CGPoint pointA = CGPointMake(x1 - r1 * cos0, y1 + r1 * sin0);
    CGPoint pointB = CGPointMake(x1 + r1 * cos0, y1 - r1 * sin0);
    CGPoint pointC = CGPointMake(x2 + r2 * cos0, y2 - r2 * sin0);
    CGPoint pointD = CGPointMake(x2 - r2 * cos0, y2 + r2 * sin0);

    CGPoint pointO = CGPointMake(pointA.x + distance * 0.5 * sin0, pointA.y + distance * 0.5 * cos0);
    CGPoint pointP = CGPointMake(pointB.x + distance * 0.5 * sin0, pointB.y + distance * 0.5 * cos0);

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:pointA];
    [path addLineToPoint:pointB];

    [path addQuadCurveToPoint:pointC
                 controlPoint:pointP
    ];

    [path addLineToPoint:pointD];

    [path addQuadCurveToPoint:pointA
                 controlPoint:pointO
    ];

    return path;
}

- (CGFloat)distanceWithSmallCircleView:(UIView *)smallView bigView:(BadgeView *)bigView;
{
    CGFloat offsetX = bigView.center.x - smallView.center.x;
    CGFloat offsetY = bigView.center.y - smallView.center.y;

    return sqrt(offsetX * offsetX + offsetY * offsetY);
}

- (void)setHighlighted:(BOOL)highlighted;
{
}


@end
