//
//  main.m
//  CarValueCoding
//
//  Created by xmg on 3/29/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Engine.h"
#import "Tire.h"
#import "Slant6.h"
#import "AllMeatherRadial.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Car *car = [[Car alloc] init];
        car.name = @"Herbie";
        car.make = @"Honda";
        car.model = @"CRX";
        car.numberOfDoors = 2;
        car.modelYear = 1984;
        car.mileage = 110000;
        
        int i;
        for (i=0; i<4; i++) {
            AllMeatherRadial *tire;
            tire = [[AllMeatherRadial alloc] init];
            [car setTire: tire atIndex: i];
        }
        
        Slant6 *engine = [[Slant6 alloc] init];
        car.engine = engine;
        NSLog(@"Car is %@", car);
        
        NSLog(@"name: %@", [car valueForKey:@"name"]);
        // 在这里可以直接通过键值找到name属性的值(通过getter)
        // 如果没有getter方法的话就再从属性里面找有没有_name或者name
        
        // %@指的是对象, 而name是一个NSString, 不是一个对象
        // 因为KVC(key-value Coding)会自动装箱和开箱标量值
        
        [car setValue:@"Harold" forKey:@"name"];
        // 也可以通过此法设置键值, 具体细节与getter类似
        NSLog(@"name: %@", [car valueForKey:@"name"]);
        
        NSLog(@"power is %@", [engine valueForKey:@"power"]);
        [engine setValue:[NSNumber numberWithInt:150] forKey:@"power"];
        NSLog(@"power is %@", [engine valueForKey:@"power"]);
        
        [car setValue:[NSNumber numberWithInt:155] forKeyPath:@"engine.power"];
        NSLog(@"power is %@", [car valueForKeyPath:@"engine.power"]);
        // KVC可以直接用键路径去访问
        // 这里通过给car发消息, 然后通过路径取修改engine的power
        // PS: 注意这里用的是forkeyPATH而不是forKey
        
        NSArray *pressures = [car valueForKeyPath:@"tires.pressure"];
        NSLog(@"pressure %@", pressures);
        // NSArray实现valueForKeyPath:的方法是循环遍历数组并向每一个对象发送信息
        // 所以NSArray向tires里的每一个tire都发送了参数,以pressure作为键路径的valueForKeyPath:消息
        // 结果就将tire对象的pressure变量封装到NSNumber里并返回
        
        // 但不能在键路径中索引数组成员,例如tires[0].pressure这样的写法就不能用
    }
    return 0;
}
