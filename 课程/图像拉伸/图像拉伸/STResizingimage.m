//
//  STResizingimage.m
//  图像拉伸
//
//  Created by kemchenj on 4/26/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STResizingimage.h"

@implementation STResizingimage

+ (UIImage *)resizingImageWithImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    
//    UIImage *resizingImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH * 0.5, imageW * 0.5, imageH * 0.5 - 1, imageW * 0.5 - 1) resizingMode:UIImageResizingModeTile];
//    return resizingImage;
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH * 0.5, imageW * 0.5, imageH * 0.5 - 1, imageW * 0.5 - 1) resizingMode:UIImageResizingModeTile];
    return image;
}

@end
