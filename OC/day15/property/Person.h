//
//  Person.h
//  day15
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"
#import "Car.h"
#import "Dog.h"

@interface Person : NSObject
{
    Room *_room;
    Car *_car;
    Dog *_dog;
}

@property(nonatomic, retain) Room *room;

@end