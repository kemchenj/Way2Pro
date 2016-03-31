//
//  main.m
//  customStructInherit
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    Student *stu = [[Student alloc] initWithAge:30 andName:@"kem" andNo:22];
    NSLog(@"%@", stu);
    return 0;
}
