//
//  Person.h
//  day14
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
    double _height;
    double _weight;
    NSString *_name;
}
//-(void)setAge:(int)age;
-(void)setHeight:(double)height;
-(void)setWeight:(double)weight;
-(void)setName:(NSString *)name;

@property int age;
@property int _age;

-(double)height;
-(double)weight;
-(NSString *)name;

@end