//
//  main.m
//  build
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    NSLog(@"%i", p.age);
    
    Person *p2 = [[Person alloc] init];
    NSLog(@"%i", p2.age);
    
    Person *p3 = [[Person alloc] init];
    NSLog(@"%i", p3.age);
    
    return 0;
}
