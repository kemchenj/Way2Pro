//
//  CategoryThing.m
//  day15
//
//  Created by xmg on 3/28/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "CategoryThing.h"

@implementation CategoryThing
-(NSString *) description
{
    NSString *desc;
    desc = [NSString stringWithFormat:@"%d %d %d", thing1, thing2, thing3];
    return desc;
}
@end
