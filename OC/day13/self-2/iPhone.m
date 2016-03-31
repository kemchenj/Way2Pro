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

-(void)cameraWithFlashlightStatus:(FlashlightStatus)status
{
    if (status == kFlashlightStatusOn){
        NSLog(@"self = %p", self);
        [self openFlashlight];
    }else{
        [self closeFlashlight];
    }
    NSLog(@"拍照");
}

-(void)openFlashlight
{
    NSLog(@"打开闪光灯");
}

-(void)closeFlashlight
{
    NSLog(@"关闭闪光灯");
}
@end