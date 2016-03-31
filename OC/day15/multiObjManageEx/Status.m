//
//  Status.m
//  day15
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Status.h"

@implementation Status

-(void)setText:(NSString *)text
{
    if (_text != text) {
        [_text release];
        _text = [text retain];
    }
}

-(void)dealloc
{
    NSLog(@"%s", __func__);
    self.text = nil;
    self.picture = nil;
    self.author = nil;
    self.repostStatus = nil;
    
    [super dealloc];
}

@end