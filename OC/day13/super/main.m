//
//  main.m
//  super
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iPhone.h"

int main(int argc, const char * argv[]) {
    iPhone *p = [iPhone new];
    [p test];
    [iPhone cameraWithFlashlightStatus:kFlashlightStatusOn];
    return 0;
}
