//
//  Person.m
//  day12
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)say
{
    NSLog(@"name = %@, age = %i", _name, _age);
}
-(void)signal:(iPhone *)phone
{
    [phone callWithNumber: 12345678];
}
@end