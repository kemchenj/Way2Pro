//
//  Soldier.m
//  day12
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "Soldier.h"

@implementation Soldier

-(void)fire:(Gun*)gun clip:(Clip *)clip
{
    if (gun!=nil && clip!=nil) {
        [gun shoot:clip];
    }
}

@end