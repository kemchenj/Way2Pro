//
// Created by kemchenj on 5/14/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "UIImage+Round.h"



@implementation UIImage (Round)

- (void)dealloc;
{
    NSLog(@"%s", sel_getName(_cmd));
}

+ (UIImage *)imageWithCircleBorderWH:(CGFloat)borderWH circleColor:(UIColor *)circleColor imageName:(NSString *)imageName;
{
    UIImage *image = [UIImage imageNamed:imageName];

    CGFloat backgroundEdgeWH = image.size.width + 2 * borderWH;
    CGRect  ctxRect          = CGRectMake(0, 0, backgroundEdgeWH, backgroundEdgeWH);

    UIGraphicsBeginImageContextWithOptions(ctxRect.size, NO, 0);

    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:ctxRect];
    [circleColor set];
    [bezierPath fill];

    CGRect       clipRect  = CGRectMake(borderWH, borderWH, image.size.width, image.size.height);
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipRect];

    [clipPath addClip];

    [image drawAtPoint:CGPointMake(borderWH, borderWH)];
    image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return image;
}

@end