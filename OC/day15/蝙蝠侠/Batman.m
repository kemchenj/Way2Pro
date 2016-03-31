//
//  Batman.m
//  day15
//
//  Created by kemchenj on 3/31/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "Batman.h"

@implementation Batman
@synthesize car;

-(void)shoot:(Enermy *) target
{
	[car shoot:target];
}

@end
