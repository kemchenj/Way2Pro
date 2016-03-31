//
//  main.m
//  CarValueCoding
//
//  Created by xmg on 3/29/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Garage.h"
#import "Tire.h"
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
        car = makeCar(@"Herbie", @"Honda", @"CRX", 1984, 2, 110000, 58);
        [garage addCar:car];
        car = makeCar(@"Herbie", @"Honda", @"CRX", 1984, 2, 110000, 58);
        [garage addCar:car];
        car = makeCar(@"Herbie", @"Honda", @"CRX", 1984, 2, 110000, 58);
        [garage addCar:car];
        car = makeCar(@"Herbie", @"Honda", @"CRX", 1984, 2, 9000, 58);
        [garage addCar:car];
        
        [garage print];
        
        NSNumber *count;
        count = [garage valueForKeyPath:@"cars.@count"];
        // @符号意味着后面将进行运算.
        // 此处的@count用于通知KVC机制计算键路劲左侧值得对象总数
        NSLog(@"We have %@ cars", count);
        
        NSNumber *sum;
        sum = [garage valueForKeyPath:@"cars.@sum.mileage"];
        NSLog(@"We have a grand total of %@ miles", sum);
        
        NSNumber *avgMileage;
        avgMileage = [garage valueForKeyPath:@"cars.@avg.mileage"];
        NSLog(@"average is %.2f", [avgMileage floatValue]);
        
        NSNumber *min, *max;
        min = [garage valueForKeyPath:@"cars.@min.mileage"];
        max = [garage valueForKeyPath:@"cars.@max.mileage"];
        NSLog(@"minimax: %@ / %@", min, max);
        // 运用KVC可以很方便地处理集合类
        
        // 但KVC需要解析字符串来计算需要的答案,因此速度比较慢
        // 而且编译器无法进行错误检查,键路径也无法进行判断
        
        NSArray *manufacturers;
        manufacturers = [garage valueForKeyPath:@"cars.@distinctUnionOfObjects.make"];
        NSLog(@"makers: %@", manufacturers);
        // 有时候变量的值只有那么几个. 例如上面构造的所有汽车.即使我们有一百万辆汽车,汽车品牌的种类实际上也很少.
        // 通过KVC就可以从集合里轻松地取出各个品牌的名称
        
    }
    return 0;
}