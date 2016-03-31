//
//  Gun.m
//  day12
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "Gun.h"

@implementation Gun

-(void)shoot:(Clip *)c
{
    if (c != nil) {
        if (c->_bullet > 0) {
            c->_bullet -= 1;
            NSLog(@"打了一枪 %i", c->_bullet);
        }else{
            NSLog(@"没有子弹了");
        }
    }else{
        NSLog(@"没有弹夹, 请换弹夹");
    }
}
@end