//
//  main.m
//  typeSEL
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    SEL sel = @selector(setAge:);
    Person *p = [Person new];
    
    BOOL flag = [p respondsToSelector:sel];
    NSLog(@"flag = %i", flag);
    
    SEL sel1 = @selector(test);
    flag = [p respondsToSelector:sel1];
    NSLog(@"flag = %i", flag);
    
    flag = [Person respondsToSelector:sel1];
    NSLog(@"flag = %i", flag);
    
    return 0;
}
