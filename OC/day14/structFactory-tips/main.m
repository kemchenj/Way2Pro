//
//  main.m
//  structFactory-tips
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    Student *stu = [Student personWithAge:30];
    Person *p = [Person personWithAge:30];
    stu.no = 888;
    NSLog(@"%@", stu);
    NSLog(@"%@", p);
    return 0;
}
