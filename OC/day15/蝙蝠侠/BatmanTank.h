//
//  BatmanTank.h
//  day15
//
//  Created by kemchenj on 3/31/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enemy.h"
#import "Launcher.h"

@interface BatmanTank : NSObject
@property Launcher *Rocket;
-(void)shoot:(Enermy *) target;

@end
