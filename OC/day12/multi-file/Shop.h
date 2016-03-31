//
//  Shop.h
//  day12
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"

@interface Shop : NSObject

+(Gun *)buyGun:(int)money;
+(Clip *)buyClip:(int)money;

@end