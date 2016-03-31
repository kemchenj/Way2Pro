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

+(void)test
{
    NSLog(@"test");
}

-(void)demo
{
    NSLog(@"demo");
}

-(void)signalWithNumber:(NSString *)number
{
    NSLog(@"number = %@", number);
}

-(void)sendMessageWithNumber:(NSString *)number andContent:(NSString *)content
{
    NSLog(@"number = %@, content = %@", number, content);
}

-(void)makeObject:(id)obj andSel:(SEL)sel
{
    [obj performSelector:sel];
}

@end