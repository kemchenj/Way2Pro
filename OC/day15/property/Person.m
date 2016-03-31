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

-(void)dealloc
{
    [_room release];
    [_car release];
    [_dog release];
    
    NSLog(@"%s", __func__);
    [super dealloc];
}

@end
