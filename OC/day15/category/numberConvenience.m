//
//  numberConvenience.m
//  day15
//
//  Created by xmg on 3/28/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "NumberConvenience.h"

@implementation NSString (NumberConvenience)
-(NSNumber *) lengthAsNumber
{
    NSUInteger length = [self length];
    return [NSNumber numberWithUnsignedLong:length];
}
@end
