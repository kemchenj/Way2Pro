//
//  Shop.m
//  day12
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "Shop.h"

@implementation Shop

+(Gun*)buyGun:(int)money
{
    Gun *gun = [Gun new];
    return gun;
}

+(Clip *)buyClip:(int)money
{
    Clip *clip = [Clip new];
    [clip addBullet];
    return clip;
}
@end