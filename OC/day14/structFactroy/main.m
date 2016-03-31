//
//  main.m
//  structFactroy
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p1 = [Person personWithAge:30];
    NSLog(@"age = %i", p1.age);
    return 0;
}
