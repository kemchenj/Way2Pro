//
//  Car.h
//  day15
//
//  Created by xmg on 3/27/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface Tire : NSObject
{
    float pressure;
    float treadDepth;
}
-(id) initWithPressure: (float) pressure;
-(id) initWithTreadDepth: (float) treadDepth;
-(id) initWithPressure: (float) pressure treadDepth:(float)treadDepth;
-(void) setPressure: (float) pressure;
-(float) pressure;
-(void) setTreadDepth: (float) treadDepth;
-(float) treadDepth;
@end

@interface Engine : NSObject
@end

@interface Car : NSObject
{
    Engine *engine;
    NSMutableArray *tires;
}
-(void) setEngine: (Engine *)newEngine;
-(Engine *) engine;
-(void) setTire: (Tire *) tire atIndex: (int) index;
-(Tire *) tireAtIndex: (int) index;
-(void)print;
@end