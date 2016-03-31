//
//  numberConvenience.h
//  day15
//
//  Created by xmg on 3/28/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NumberConvenience)
// 这里的意思就是我们为NSString类添加了一个名为NumberConvenience的类别

// 类别可以添加属性,但不能添加实例变量
// 而且属性必须是@dynamic类型的

// 通过category不需要创建NSString类的子类就可以给NSString添加一种新的方法

// 类别有两个局限性
// 1. 无法向类中添加新的实例变量. 类别没有空间容纳实例变量
// 2. 名称冲突, 类别中的方法可能会跟现有的方法重名.
    // 2.1冲突的时候, 类别具有更高的优先级, 会导致初始方法不可用

// 类别有三个主要用途
// 1. 将类的实现代码分散到多个不同文件和框架中
// 2. 创建对私有方法的前向引用
// 3. 向对象添加非正式协议(informal protocol)
-(NSNumber *) lengthAsNumber;

@end
