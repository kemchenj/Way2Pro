//
//  Phone.m
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"

@implementation Phone

-(void)cameraWithFlashlightStatus:(FlashlightStatus)status
{
    NSLog(@"- cameraWithFlashlightStatus");
}

+(void)cameraWithFlashlightStatus:(FlashlightStatus)status
{
    if (status == kFlashlightStatusOn) {
        [self openFlashlight];
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