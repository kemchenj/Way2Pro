//
//  Car.h
//  day15
//
//  Created by xmg on 3/27/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "Tire.h"
#import "Engine.h"

@interface Car : NSObject <NSCopying>
{
    NSString *appellation;
}

@property (copy)NSString *name;
@property (retain)Engine *engine;
// 查资料!!!
@property NSMutableArray *tires;

-(void)setTire: (Tire *) tire atIndex: (int) index;
-(void)print;
-(Tire *) tireAtIndex: (int)index;

@end