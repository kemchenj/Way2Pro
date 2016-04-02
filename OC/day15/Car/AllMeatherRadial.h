//
//  AllWeatherRadial.h
//  day15
//
//  Created by xmg on 3/27/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface AllMeatherRadial : Tire
{
    float rainHandling;
    float snowHandling;
}

-(void) setRainHandling: (float) rainHandling;
-(float) rainHandling;

-(void) setSnowhandling: (float) snowHandling;
-(float) snowHandling;

@end