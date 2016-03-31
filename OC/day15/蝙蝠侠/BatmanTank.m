//
//  BatmanTank.m
//  day15
//
//  Created by kemchenj on 3/31/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "BatmanTank.h"
#import "Enemy.h"
#import "Launcher.h"

@implementation BatmanTank
@synthesize Rocket;

-(void)shoot:(Enermy *) target;
{
	[Rocket shoot:target];
}

@end
