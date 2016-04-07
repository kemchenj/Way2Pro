//
//  Baby.m
//  Day16
//
//  Created by kemchenj on 4/6/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "Baby.h"

@implementation Baby

-(void)hungry
{
    self.food -= 5;
    NSLog(@"婴儿饿了");
    if ([self.nanny respondsToSelector:@selector(feedWithBaby:)]) {
        [self.nanny feedWithBaby:self];
    }
}

-(void)sleepy
{
    self.drowsiness += 5;
    NSLog(@"婴儿困了");
    if ([self.nanny respondsToSelector:@selector(hypnosisWithBaby:)]) {
        [self.nanny hypnosisWithBaby:self];
    }
}

@end
