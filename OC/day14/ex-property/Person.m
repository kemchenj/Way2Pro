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
-(void)setAge:(int)age
{
    if (age <0) {
        age = 0;
    }
    _age = age;
}
        
@end