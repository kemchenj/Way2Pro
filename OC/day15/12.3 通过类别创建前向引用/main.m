//
//  main.m
//  12.3 通过类别创建前向引用
//
//  Created by xmg on 3/28/16.
//  Copyright © 2016 xmg. All rights reserved.
//

// Main:
// cocoa没有真正的私有方法,所有方法我们可以调用,但编译器会报错,这样的"error"实际上也是有益的
// 不在类的@interface部分列出自己的全部方法,有许多充分的理由.
// 这些方法可能是纯粹的实现细节,你可能将根据方法的名称来确定要使用哪个方法
// 如果不方便定义的话,就需要采取其它措施

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
