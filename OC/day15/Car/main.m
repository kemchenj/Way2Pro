//
//  main.m
//  Car
//
//  Created by xmg on 3/27/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Slant6.h"
#import "AllMeatherRadial.h"

int main(int argc, const char * argv[]) {
    Car *car = [[Car alloc] init];
    for (int i=0; i<4; i++) {
        Tire *tire;
        
        // tire = [[Tire alloc] init];
        // [tire setPressure: 23+i];
        // [tire setTreadDepth: 33-i];
        // tire的属性本来要逐一进行初始化, 但现在可以直接一次性初始化
        tire = [[Tire alloc] initWithPressure: 23+i treadDepth: 33-i];
        
        [car setTire: tire atIndex: i];
    }
    Engine *engine = [[Slant6 alloc] init];
    [car setEngine: engine];
    [car print];
    
    for (int i=0; i<4; i++) {
        AllMeatherRadial *tire;
        tire = [[AllMeatherRadial alloc] init];
        [car setTire:tire atIndex:i];
    }
    
    [car print];
    
    return 0;
}
