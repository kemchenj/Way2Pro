//
//  main.m
//  autorelease
//
//  Created by xmg on 3/26/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSAutoreleasePool *pool;
    pool = [[NSAutoreleasePool alloc] init];
    int i;
    for (i=0; i<100000; i++) {
        id object = [someArray objectAtIndex: i];
        NSString *desc = [object description];
        if (i % 1000 == 0) {
            [pool release];
            pool = [[NSAutoreleasePool alloc] init];
        }
    }
    [pool release];
    return 0;
}
