//
//  iPhone.h
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    kFlashlightStatusOn,
    kFlashlightStatusOff,
} FlashlightStatus;

@interface iPhone : NSObject
{
    int _cpu;
}
+(void)cameraWithFlashLightStatus:(FlashlightStatus)status;
+(void)openFlashlight;
+(void)closeFlashlight;
@end