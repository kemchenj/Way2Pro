//
//  Phone.h
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    kFlashlightStatusOn,
    kFlashlightStatusOff
}FlashlightStatus;

@interface Phone : NSObject

+(void)cameraWithFlashlightStatus:(FlashlightStatus)status;
-(void)cameraWithFlashlightStatus:(FlashlightStatus)status;

+(void)openFlashlight;
+(void)closeFlashlight;

@end