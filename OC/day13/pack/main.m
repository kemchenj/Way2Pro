//
//  main.m
//  pack
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"
// 封装起来使用会更加方便,更加objective

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Gun *gun = [Gun new];
        
        [gun addBullet:100];
        
        [gun shoot];
        
        NSLog(@"Bullet = %i", [gun getBullet]);
    }
    return 0;
}
