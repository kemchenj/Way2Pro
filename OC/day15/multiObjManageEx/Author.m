//
//  Author.m
//  day15
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"

@implementation Author

-(void)dealloc
{
    NSLog(@"%s", __func__);
    [_name release];
    [_icon release];
    [_account release];
    [super dealloc];
}

@end
