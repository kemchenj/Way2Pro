//
//  main.m
//  12.2利用类分散代码
//
//  Created by xmg on 3/28/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryThing.h"

//统一声明, 分多个文件实现能够提高团队协作的效率

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        CategoryThing *thing = [[CategoryThing alloc] init];
        [thing setThing1:5];
        [thing setThing2:23];
        [thing setThing3:42];
        NSLog(@"Things are %@", thing);
    }
    return 0;
}
