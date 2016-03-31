//
//  main.m
//  getter-setter
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"

int main(int argc, const char * argv[]) {
    Gun *gun = [Gun new];
    [gun setSize:5];
    // 使用对象方法调用会更安全,避免外部方法的调用
    NSLog(@"size = %i", [gun size]);
    return 0;
}
