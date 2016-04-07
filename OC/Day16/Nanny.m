//
//  Nanny.m
//  Day16
//
//  Created by kemchenj on 4/6/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "Nanny.h"
#import "Baby.h"

@implementation Nanny

-(void)feedWithBaby:(Baby *)baby
{
    baby.food += 10;
    NSLog(@"给婴儿喂奶, 现在的饿意%i", baby.food);
}

-(void)hypnosisWithBaby:(Baby *)baby
{
    baby.drowsiness += 10;
    NSLog(@"哄婴儿睡觉, 现在的睡意是%i", baby.drowsiness);
}

@end
