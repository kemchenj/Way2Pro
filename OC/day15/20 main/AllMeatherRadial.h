//
//  AllWeatherRadial.h
//  day15
//
//  Created by xmg on 3/27/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tire.h"

@interface AllMeatherRadial : Tire

//{
//    float rainHandling;
//    float snowHandling;
//}
// property会自动帮我们创建实例变量

@property float rainHandling;
@property float snowHandling;
// property意味着声明了一个新对象的属性, 并且自动声明该对象的set和get(setSnowHandling, snowHandling)
// 这是编译器自动添加的

@end