//
//  Account.m
//  day15
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@implementation Account

-(void)dealloc
{
    NSLog(@"%s", __func__);
    [_email release];
    [_pwd release];
    [super dealloc];
}

@end
