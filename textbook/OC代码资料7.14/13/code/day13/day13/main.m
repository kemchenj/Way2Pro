//
//  main.m
//  day13
//
//  Created by xiaomage on 15/6/19.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"

int main(int argc, const char * argv[]) {
    
    // 1.创建一把枪
    Gun *gun = [Gun new];
    // 2.设置枪的子弹数量
//    gun->_bullet = 100;
    // 引发这个问题的原因: 因为成员变量是public, 给成员变量赋值的时, 赋值的值不受我们的约束
//    gun->_bullet = -100;
    
    [gun addBullet:100];
    
    // 3.射击
    [gun shoot];
    
    // 4.查看子弹的剩余数据(获取成员变量的值)
//    NSLog(@"bullet = %i", gun->_bullet);
    NSLog(@"BULLET = %i", [gun getBullet]);
    

    return 0;
}
