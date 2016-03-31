//
//  main.m
//  custom-struct
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] initWithAge:20 andName:@"kem"];
    NSLog(@"%@", p);
    
    Person *p2 = [[Person alloc] initWithAge:30 andName:@"sin"];
    NSLog(@"%@", p2);
    
    return 0;
}
