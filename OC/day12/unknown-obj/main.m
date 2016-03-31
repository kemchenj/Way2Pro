//
//  main.m
//  unknown-obj
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"
#import "iPhone.h"

int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    p->_age = 30;
    p->_name = @"kem";
    [p say];
    
    [Person new]->_age = 30;
    [Person new]->_name = @"cc";
    [[Person new] say];
    
    iPhone *phone = [iPhone new];
//    每次调用new方法的时候都会重新开辟一片空间
    [phone brand];
    
    [[iPhone new] brand];
    
    Person *p1 = [Person new];
    [p1 signal:[iPhone new]];
    
    return 0;
}
