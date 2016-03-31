//
//  Person.h
//  day14
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property int age;
@property NSString *name;

-(instancetype)initWithAge:(int)age;
-(instancetype)initWithName:(NSString *)name;
-(instancetype)initWithAge:(int)age andName:(NSString *)name;

@end