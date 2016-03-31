//
//  Person.h
//  day14
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(readwrite) int age;

@property(getter = abc) double height;

@property(setter = tiZhong:) double weight;

@property(readonly) NSString *name;

@property(getter = isMarried) BOOL married;

@end