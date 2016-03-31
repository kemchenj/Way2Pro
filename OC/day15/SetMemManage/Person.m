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
    if (_room != room) {
        [_room release];
        
        _room = [room retain];
    }
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