//
//  main.m
//  new
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p1 = [Person alloc];
    Person *p2 = [p1 init];
    
    NSLog(@"p1 = %p, p2 = %p", p1, p2);
    
    Person *p3 = [[Person alloc] init];
    
    return 0;
}
