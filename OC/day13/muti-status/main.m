//
//  main.m
//  muti-status
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Cat.h"
#import "Animal.h"
#import "Person.h"
#import "Pig.h"

int main(int argc, const char * argv[]) {
    Dog *d = [Dog new];
    Cat *c = [Cat new];
    Pig *p = [Pig new];
    
    [Person food:d];
    [Person food:c];
    [Person food:p];
    
    return 0;
}
