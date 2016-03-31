//
//  main.m
//  multiObjManage
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Room.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        Room *r = [[Room alloc] init];
        r.no = 888;
        
        p.room = r;
        
        [r release];
        
        NSLog(@"------");
        
        [p release];
    }
    return 0;
}
