//
//  Car.m
//  day15
//
//  Created by xmg on 3/27/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"


@implementation Car

@synthesize tires;
@synthesize name;
@synthesize engine;
@synthesize make;
@synthesize model;
@synthesize modelYear;
@synthesize numberOfDoors;
@synthesize mileage;

-(id) init
{
    if (self = [super init]) {
        self.name = @"Car";
        tires = [[NSMutableArray alloc] init];
        for (int i=0; i<4; i++) {
            [tires addObject:[NSNull null]];
        }
    }
    return (self);
}

-(Tire *) tireAtIndex: (int) index
{
    //    if (index < 0 || index >3) {
    //        NSLog(@"bad index (%d) in setTire: atIndex:", index);
    //        exit(1);
    //    }
    //    return (tires[index]);
        
    //    Tire *tire;
    //    tire = [tires objectAtIndex: index];
    //    return (tire);
    
    return [tires objectAtIndex: index];
    // 省略了中转变量,但代码可读性会下降
}

-(void) setTire: (Tire *) tire atIndex: (int) index
{
    [tires replaceObjectAtIndex:index withObject:tire];
}

-(void) print
{
    NSLog(@"%@", self.name);
    NSLog(@"%@", engine);
    for (int i=0; i<4; i++) {
        NSLog(@"%@", [self tireAtIndex:i]);
    }
    NSLog(@"\n");
}

-(id) copyWithZone:(NSZone *)zone
{
    Car *carCopy;
    carCopy = [[[self class] allocWithZone:zone] init];
    carCopy.name = name;
    carCopy.make = make;
    carCopy.model = model;
    carCopy.numberOfDoors = numberOfDoors;
    carCopy.mileage = mileage;
    
    Engine *engineCopy;
    engineCopy = [engine copy];
    carCopy.engine = engineCopy;
    
    for (int i=0; i<4; i++) {
        Tire *tireCopy;
        tireCopy = [[self tireAtIndex:i] copy];
        [carCopy setTire:tireCopy atIndex:i];
    }
    
    return carCopy;
}

-(NSString *)description
{
    NSString *desc;
    desc = [NSString stringWithFormat:@"%@, a %d %@ %@, has %d doors, %.1f miles, %@ hp and %lu tires.", name, modelYear, make, model, numberOfDoors, mileage, [engine valueForKey:@"power"] ,(unsigned long)[tires count]];
    return desc;
}
@end