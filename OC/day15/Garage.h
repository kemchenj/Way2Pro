//
//  Garage.h
//  day15
//
//  Created by xmg on 3/29/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@class Car;

@interface Garage : NSObject
{
    NSString *name;
    NSMutableArray *cars;
}
@property (readwrite, copy) NSString *name;
-(void) addCar:(Car *)car;
-(void) print;

@end
