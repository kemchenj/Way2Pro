//
//  main.m
//  synthesize
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    [p setAge:88];
    NSLog(@"_age = %i, age = %i", p->_age, p->age);
    return 0;
}
