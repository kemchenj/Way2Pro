//
//  iPhone.m
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iPhone.h"

@implementation iPhone

+(void)cameraWithFlashLightStatus:(FlashlightStatus)status
{
    if (status == kFlashlightStatusOn) {
        [self openFlashlight];
        // self指代的是iPhone这个类
    }else{
        [self closeFlashlight];
    }
    NSLog(@"拍照");
}

+(void)openFlashlight
{
    NSLog(@"打开闪光灯");
}

+(void)closeFlashlight
{
    NSLog(@"关闭闪光灯");
}

@end