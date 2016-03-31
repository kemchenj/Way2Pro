//
//  main.m
//  18.5批处理
//
//  Created by xmg on 3/29/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllMeatherRadial.h"
#import "Engine.h"
#import "Car.h"
#import "Tire.h"
#import "Garage.h"
#import "Slant6.h"

Car *makeCar (NSString *name, NSString *make, NSString *model, int modelYear, int numberOfDoors, float mileage, int power)
{
    Car *car = [[Car alloc] init];
    car.name = name;
    car.make = make;
    car.model = model;
    car.modelYear = modelYear;
    car.numberOfDoors = numberOfDoors;
    car.mileage = mileage;
    
    Engine *engine = [[Engine alloc] init];
    [engine setValue:[NSNumber numberWithInt: power] forKey:@"power"];
    car.engine = engine;
    
    for (int i=0; i<4; i++) {
        Tire *tire = [[Tire alloc] init];
        [car setTire:tire atIndex:i];
    }
    return car;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Garage *garage = [[Garage alloc] init];
        garage.name = @"Joe's Garage";
        Car *car;
        car = makeCar(@"Herbie", @"Honda", @"CRX", 1984, 2, 110000, 58);
        [garage addCar:car];
        car = makeCar(@"Herbie", @"Honda", @"CRX", 1984, 2, 110000, 58);
        [garage addCar:car];
        car = makeCar(@"Herbie", @"Honda", @"CRX", 1984, 2, 110000, 58);
        [garage addCar:car];
        
        car = [[garage valueForKeyPath: @"cars"] lastObject];
        // 获取garage里cars数组的最后一个对象, 赋值给car
        NSArray *keys = [NSArray arrayWithObjects:@"make", @"model", @"modelYear", nil];
        // 建立一个数组保存想要获取的数据键名
        NSDictionary *carValues = [car dictionaryWithValuesForKeys: keys];
        // 通过键名的数组在car里获取相应的键值
        NSLog(@"car values : %@", carValues);
        
        NSDictionary *newValues = [NSDictionary dictionaryWithObjectsAndKeys: @"Chevy", @"make", @"Nova", @"model", [NSNumber numberWithInt:1964], @"modelYear", nil];
        [car setValuesForKeysWithDictionary: newValues];
        // 建立一个新的dictionary建立键和值的对应关系
        // chevy对应make, nova对应model这样两个一对的格式
        // 以nil结束
        
        // 需要注意的是, 虽然型号跟生产年限改了, 但其它值都还是没有变
        NSLog(@"car with new values is %@", car);
        
        
        [garage setValue:@"bunny" forKey:@"fluffy"];
        [garage setValue:@"greeble" forKey:@"bork"];
        [garage setValue:[NSNull null]forKey:@"snorgle"];
        [garage setValue:nil forKey:@"gronk"];
        
        NSLog(@"values are %@ %@ %@ and %@", [garage valueForKey:@"fluffy"], [garage valueForKey:@"bork"], [garage valueForKey:@"snorgle"], [garage valueForKey:@"gronk"]);
    }
    return 0;
}
