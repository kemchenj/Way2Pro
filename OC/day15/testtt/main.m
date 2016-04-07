//
//  main.m
//  testtt
//
//  Created by kemchenj on 4/5/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test *tt = [test new];
        tt.number = 13;
        NSLog(@"%d", tt.number);
    }
    return 0;
}
