//
//  main.m
//  classStartup
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"
void demo(Class c);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [[Person alloc] init];
        Person *p2 = [[Person alloc] init];
        
        Class c1 = [p1 class];
        Class c2 = [p2 class];
        Class c3 = [Person class];
        NSLog(@"c1 = %p, c2 = %p, c3 = %p", c1, c2, c3);
        
        Person *p3 = [[c1 alloc] init];
        p3.age = 30;
        NSLog(@"%i", p3.age);
        [c1 test];
        
        demo(c1);
        demo([Car class]);
    }
    return 0;
}

void demo(Class c)
{
    id obj = [[c alloc] init];
    NSLog(@"%@", obj);
}