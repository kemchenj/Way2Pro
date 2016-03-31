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

- (void)dealloc
{
    NSLog(@"Person dealloc");
    
    [super dealloc];
}

@end