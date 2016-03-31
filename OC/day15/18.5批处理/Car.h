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
    NSString *name;
    NSMutableArray *tires;
    Engine *engine;
    NSString *make;
    NSString *model;
    int modelYear;
    int numberOfDoors;
    float mileage;
}

@property (readwrite, copy)NSString *name;
@property (readwrite, retain)Engine *engine;
@property (readwrite, copy)NSString *make;
@property (readwrite, copy)NSString *model;
@property (readwrite) int modelYear;
@property (readwrite) int numberOfDoors;
@property (readwrite) float mileage;
@property NSMutableArray *tires;

-(void)setTire: (Tire *) tire atIndex: (int) index;
-(void)print;
-(Tire *) tireAtIndex: (int)index;

@end