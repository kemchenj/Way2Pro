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

-(instancetype)init
{
    if (self = [super init]) {
        _no = 1;
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"age = %i, no = %i", [self age], _no];
}
@end