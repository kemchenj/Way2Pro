//
//  Person.m
//  day14
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person

+(void)load
{
    NSLog(@"Person类被加载到内存了");
}

+(void)initialize
{
    NSLog(@"Person initialize");
}

@end
