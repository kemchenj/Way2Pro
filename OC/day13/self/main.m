//
//  main.m
//  self
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iPhone.h"

int main(int argc, const char * argv[]) {
    [iPhone cameraWithFlashLightStatus:kFlashlightStatusOff];
    //self不能离开类,离开类之后就没有意义
    return 0;
}
