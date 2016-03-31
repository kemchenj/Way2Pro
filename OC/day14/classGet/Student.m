//
//  Student.m
//  day14
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@implementation Student

+(void)load
{
    NSLog(@"Student类被加载到内存了");
}

+(void)initialize
{
    NSLog(@"Student initialize");
}

@end