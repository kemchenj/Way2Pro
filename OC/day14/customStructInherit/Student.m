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

-(instancetype)initWithAge:(int)age andName:(NSString *)name andNo:(int)no
{
    if (self = [super initWithAge:age andName:name]) {
        _no = no;
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"age = %i, name = %@, no = %i", [self age], [self name], _no];
}

@end
