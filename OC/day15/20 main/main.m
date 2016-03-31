//
//  main.m
//  20 main
//
//  Created by xmg on 3/31/16.
//  Copyright © 2016 xmg. All rights reserved.
//

// 编写软件时, 经常需要获取一个对象集合, 并通过某些已知条件计算该集合的值.
// 你需要保留符合某个条件的对象, 删除那些不满足条件的对象, 从而提供一些有用处的对象.

// cocoa提供了一个名为NSPredicate的类,它用于指定过滤器的条件
// 可以通过创建NSPredicate对象, 通过谓词筛选每一个对象, 判断它们是否与条件相匹配

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
        
        car = makeCar(@"Badger", @"Acura", @"Integra", 1987, 5, 217036, 130);
        [garage addCar:car];
        
        car = makeCar(@"Elvis", @"Acura", @"Legend", 1969, 4, 28213, 151);
        [garage addCar:car];
        
        car = makeCar(@"Phoenix", @"Pontiac", @"Firebird", 1950, 2, 39100, 36);
        [garage addCar:car];
        
        car = makeCar(@"Elvis", @"Acura", @"Legend", 1969, 4, 28213, 151);
        [garage addCar:car];
        
        NSPredicate *predicate;
        predicate = [NSPredicate predicateWithFormat:@"name == 'Elvis'"];
        // 这里使用了类方法+predicateWithFormat来创建一个真是的谓词.
        // 将某个字符串赋给谓词, +predicateWithFormat使用该字符串在后台构建对象数, 来计算谓词的值
        
        BOOL match = [predicate evaluateWithObject:car];
        // evluate用于接收谓词, 根据predicate的条件进行判断
        NSLog(@"%s", (match) ? "YES" : "NO");
        
        predicate = [NSPredicate predicateWithFormat:@"engine.power > 129"];
        // engine.power是一个键路径
        // 路径链接到汽车内部, 查找引擎, 然后查找引擎马力.
        // 接下来, 将马力值与129进行比较,看 他是否更大, 返回一个布尔值
        match = [predicate evaluateWithObject:car];
        
        NSArray *cars;
        cars = [garage valueForKey:@"cars"];
        for (Car *car in cars) {
            if ([predicate evaluateWithObject:car]) {
                NSLog(@"%@", car.name);
            }
        }
        // 遍历cars数组, 如果cars里的其中一辆"car"的power大于129, 就把它的名字print出来
        
        
        NSArray *results;
        results = [cars filteredArrayUsingPredicate:predicate];
        // filteredArrayUsingPredicate是NSArray的一种类方法
        // 它会自动过滤数组内容, 根据谓词计算灭一个对象的值
        // 并将值为YES的对象添加到将被返回的新数组中
        NSLog(@"%@", results);
        
        NSArray *names;
        names = [results valueForKey:@"name"];
        // 通过KVC提取results对象数组中对象的name键值
        NSLog(@"%@", names);
        
        predicate = [NSPredicate predicateWithFormat:@"engine.power > 140"];
        NSMutableArray *carsCopy = [cars mutableCopy];
        [carsCopy filterUsingPredicate: predicate];
        NSLog(@"%@", carsCopy);
        // 假设我们有一个可变数组, 并且需要剔除掉不需要的成员的话
        // 可以使用 filterUsingPredicate来完成
        
        // 使用谓词很便捷, 但运行速度不会比自己手动编写的代码块.
        // 因为它无法避免在所有汽车之间使用循环和对每一辆汽车进行某些操作
        // 如果遇到速度问题, 可以使用官方工具来测试程序性能, 检测速度瓶颈, 然后进行优化
        
        
        predicate = [NSPredicate predicateWithFormat:@"engine.power > %d", 50];
        // 这里可以使用占位符, 并且引入变量来动态修改过滤条件
        predicate = [NSPredicate predicateWithFormat:@"name == %@", @"Herbie"];
        // %@在这里会被当做一个有引号的
        // 如果为%@打了单引号, 那%@就会被当做是谓词字符串中的普通字符, 失去占位符的作用
        
        // 构造灵活的谓词:
        // 第一种方法, NSPredicate字符串里用%K来指定键路径
        predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"name", @"Herbie"];
        
        // 第二种方法, 是把变量名放到字符串里, 类似于环境变量的作用
        NSPredicate *PredicateTemplete = [NSPredicate predicateWithFormat:@"name == $NAME"];
        NSDictionary *varDict;
        varDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Herbie", @"NAME", nil];
        predicate = [PredicateTemplete predicateWithSubstitutionVariables:varDict];
        // 调用predicateWithSubstitutionVariables方法把preadicate变为一个有变量的谓词
        
        PredicateTemplete = [NSPredicate predicateWithFormat:@"engine.power > $POWER"];
        varDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:129], @"POWER", nil];
        predicate = [PredicateTemplete predicateWithSubstitutionVariables:varDict];
        // 注意: 不能使用"$变量名"作为键路径, 它只能表示值
        // 使用谓词占位符的时候, 如果想要在程序里中通过代码修改键路径, 需要使用%K占位符
        // 谓词机制不会进行静态类型检查, 也许会造成未知的类型错误
        
        
        predicate= [NSPredicate predicateWithFormat:@"name < 'Newton'"];
        results = [cars filteredArrayUsingPredicate:predicate];
        NSLog(@"%@", [results valueForKey: @"name"]);
        // 如果需要按照字母表去查看车子,可以使用这种字符串对比的方法
        
        predicate = [NSPredicate predicateWithFormat:@"engine.power BETWEEN{50,200}"];
        
        NSArray *betweens = [NSArray arrayWithObjects:[NSNumber numberWithInt:50], [NSNumber numberWithInt:200], nil];
        predicate = [NSPredicate predicateWithFormat:@"engine.power BETWEEN %@", betweens];
        // 输入数组, 可以通过between来过滤出范围内的谓词
        // between把50作为数组的下限, 200作为上限
        
        PredicateTemplete = [NSPredicate predicateWithFormat:@"engine.power BETWEEN %POWERS"];
        varDict = [NSDictionary dictionaryWithObjectsAndKeys: betweens, @"POWERS", nil];
        predicate = [PredicateTemplete predicateWithSubstitutionVariables: varDict];
        
        predicate = [NSPredicate predicateWithFormat: @"SELF.name IN {'Herbie', 'Snugs', 'Badger', 'Flap'}"];
        // 使用路径的话, 谓词只能适用于一个路径的过滤
        // 改用SELF的话, 就可以复用到其它对象上
        // SELF响应的是谓词计算的对象
        
        
		names = [cars valueForKey:@"name"];
		predicate = [NSPredicate predicateWithFormat:@"SELF IN {'Herbie', 'Snugs', 'Badger', 'Flap'}"];
		results = [names filteredArrayUsingPredicate: predicate];
		NSLog(@"%@", results);
		
		NSArray *names1 = [NSArray arrayWithObjects:@"Herbie", @"Badger", @"Judge", @"Elvis", nil];
		NSArray *names2 = [NSArray arrayWithObjects:@"Judge", @"Paper car", @"Badger", @"Phoenix", nil];
		
		predicate = [NSPredicate predicateWithFormat:@"SELF IN %@", names1];
		results = [names2 filteredArrayUsingPredicate:predicate];
		NSLog(@"%@", results);
		// 通过这种方法取两个集合的交集
    }
    return 0;
}