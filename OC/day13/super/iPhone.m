
//  iPhone.m
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iPhone.h"

@implementation iPhone

+(void)cameraWithFlashlightStatus:(FlashlightStatus)status
{
    NSLog(@"聚焦");
    NSLog(@"调光");
    NSLog(@"人脸识别");
    
    [super cameraWithFlashlightStatus:status];
    // 调用父类的方法时要用super
}

-(void)test
{
    [super cameraWithFlashlightStatus:kFlashlightStatusOn];
}

@end
