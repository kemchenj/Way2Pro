//
//  Gun.m
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"

@implementation Gun
-(void)shoot
{
    if(_bullet > 0){
        _bullet--;
        NSLog(@"打了一枪, 还剩%i颗子弹", _bullet);
    }else{
        NSLog(@"没有子弹了");
    }
}

-(void)addBullet:(int)count
{
    if(count < 0){
        count = 0;
    }
    _bullet = count;
}

-(int)getBullet
{
    return _bullet;
}

@end