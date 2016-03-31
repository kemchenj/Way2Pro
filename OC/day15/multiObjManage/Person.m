//
//  Person.m
//  day15
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person

-(void)setRoom:(Room *)room
{
    [room retain];
    _room = room;
}

-(Room *)room
{
    return _room;
}

-(void)dealloc
{
    [_room release];
    NSLog(@"%s", __func__);
    [super dealloc];
}

@end