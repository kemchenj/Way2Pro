//
//  main.m
//  multi-file
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Soldier.h"
#import "Shop.h"

int main(int argc, const char * argv[]) {
    Soldier *sp = [Soldier new];
    sp->_name = @"史泰龙";
    sp->_height = 1.88;
    sp->_weight = 100.0;
    
    Gun *gp = [Shop buyGun:888];
    
    Clip *clip = [Shop buyClip:100];
    
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    [sp fire:gp clip:clip];
    clip = [Shop buyClip:100];
    [sp fire:gp clip:clip];
    
    return 0;
}
