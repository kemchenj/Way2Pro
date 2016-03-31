//
//  kLIne.m
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "kLine.h"

@implementation kLine
-(int)min
{
    return _min;
}
                   
-(int)max
{
    return _max;
}
        
-(int)average
{
    return _average;
}

-(void)setMax:(int)max
{
    _max = max;
    _average = (_min+_max) / 2;
    // set封装起来的时候,外部调用也可以自动刷新相关联的值(例如average)
}

-(void)setMin:(int)min
{
    _min = min;
    _average = (_min + _max) / 2;
}

-(void)setAverage:(int)average
{
    _average = average;
    
}
                   
@end