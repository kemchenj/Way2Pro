//
//  main.m
//  property-dec
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    
    p.height = 99;
    NSLog(@"height = %f", [p abc]);
    
    [p tiZhong:100.0];
    NSLog(@"weight = %f", [p weight]);
    
    [p setMarried:YES];
    
    if ([p isMarried]) {
        NSLog(@"已婚");
    }else{
        NSLog(@"未婚");
    }
    
    return 0;
}
