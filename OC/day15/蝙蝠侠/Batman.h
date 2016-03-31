//
//  Batman.h
//  day15
//
//  Created by kemchenj on 3/31/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BatmanTank.h"
#import "Enemy.h"

@interface Batman : NSObject
@property BatmanTank* car;
-(void)shoot:(Enermy *) target;
@end
