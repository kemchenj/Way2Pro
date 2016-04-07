//
//  main.m
//  CarProperty
//
//  Created by xmg on 3/28/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tire.h"
#import "AllMeatherRadial.h"
#import "Engine.h"
#import "Car.h"
#import "Slant6.h"

int main(int argc, const char * argv[]) {
    Car* car = [[Car alloc] init];
    car.name = @"Gummy";

    for (int i=0; i<4; i++) {
        AllMeatherRadial *tire;

        tire = [[AllMeatherRadial alloc] init];
        // [tire setRainHandling:20+i];
        // [tire setSnowHandling:28+i];

        tire.rainHandling = 20+i;
        tire.snowHandling = 28+i;
        // 点表达式的应用, 如果点表达式在=的左边的话就默认为set, 在=的右边的话就默认为get

        NSLog(@"tire %d's handling is %.f %.f", i, [tire rainHandling], [tire snowHandling]);
        [car setTire:tire atIndex:i];
    }

    Slant6 *engine = [[Slant6 alloc] init];
    car.engine=engine;

    [car print];

    Car *carCopy = [car copy];
    [carCopy print];

    return 0;
}
