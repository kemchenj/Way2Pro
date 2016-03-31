//
//  main.m
//  day15
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        
        NSLog(@"retainCount = %lu", [p retainCount]);
        
        [p retain];
        NSLog(@"retainCount = %lu", [p retainCount]);
        
        [p release];
        NSLog(@"retainCount = %lu", [p retainCount]);
                                     
        [p release];
        NSLog(@"--------");
    }
    return 0;
}
