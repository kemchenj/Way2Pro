//
//  main.m
//  empty-pointer
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        
        [p release];
//        [p release];
        
        p = nil;
        
        [p release];
        [p release];
        [p release];
        [p release];
        [p release];
        [p release];
        [p release];
    }
    return 0;
    
}
