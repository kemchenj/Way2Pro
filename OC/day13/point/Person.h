//
//  Person.h
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
    NSString *_name;
    double _height;
}
-(void)setAge:(int)age;
-(void)setName:(NSString *)name;
-(void)setHeight:(double)height;

-(int)age;
-(double)height;
-(NSString *)name;

-(void)test;

@end