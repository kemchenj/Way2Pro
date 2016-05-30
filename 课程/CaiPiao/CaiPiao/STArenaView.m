//
//  STArenaView.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STArenaView.h"



@implementation STArenaView

- (void)drawRect:(CGRect)rect;
{
    UIImage *image = [UIImage imageNamed:@"NLArenaBackground"];

    [image drawInRect:rect];
}

@end
