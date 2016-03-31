//
//  kLIne.h
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface kLine : NSObject
{
    int _max;
    int _min;
    int _average;
}

-(void)setMax:(int)max;
-(void)setMin:(int)Min;
-(void)setAverage:(int)average;
-(int)min;
-(int)max;
-(int)average;

@end