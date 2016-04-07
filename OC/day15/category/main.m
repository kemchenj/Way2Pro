//
//  main.m
//  category
//
//  Created by xmg on 3/28/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NumberConvenience.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        // 建立一个可变词典, 可以让我们成对地存储键和对象

        [dict setObject:[@"hello" lengthAsNumber] forKey:@"hello"];
        // [@"hello" lengthAsNumber]
        // 其中@"hello"作为NSString调用了lengthAsNumber去取字符串长度
        // 作为键值@"hello"的对象存在

        [dict setObject:[@"iLikeFish" lengthAsNumber] forKey:@"iLikeFish"];

        [dict setObject:[@"Once upon a time" lengthAsNumber] forKey:@"Once upon a time"];

        NSLog(@"%@", dict);
    }
    return 0;
}
