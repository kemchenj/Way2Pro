//
//  main.m
//  test2
//
//  Created by xmg on 3/29/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Person : NSObject
{
    @public
    double weight;
    int age;
}
@end

@implementation Person
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [Person new];
        Person *p2= [Person new];
        NSLog(@"p.            = %p", p);
        NSLog(@"p. weight     = %p", &(p->weight));
        NSLog(@"p. weight     = %p", &(p->weight));
        NSLog(@"p. superClass = %p", ( (&(p->weight)) -1 ));
    
        NSLog(@"p2            = %p", p2);
        NSLog(@"p2.weight     = %p", &(p2->weight));
        NSLog(@"p2.superClass = %p", ((&(p2->weight))-1));
    }
    return 0;
}
