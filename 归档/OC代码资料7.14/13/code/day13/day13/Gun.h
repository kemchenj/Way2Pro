//
//  Gun.h
//  day13
//
//  Created by xiaomage on 15/6/19.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gun : NSObject
{
//    @public
    int _bullet; // 子弹
    // 虽然成员变量不是public之后外界不能直接访问了, 但是还是可以在本类的对象方法中直接访问
}

/**
 *  射击方法
 */
- (void)shoot;


// 提供一个方法用于设置成员变量的值
- (void)addBullet:(int)count;

// 提供一个方法用于返回成员变量的值
- (int)getBullet;
@end
