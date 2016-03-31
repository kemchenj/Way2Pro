//
//  main.m
//  property
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    Room *r = [Room new];
    
    p.room = r;
    [r release];
    
    p.room = r;
    
    [p release];
    return 0;
}
