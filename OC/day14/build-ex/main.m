//
//  main.m
//  build-ex
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    Student *stu = [[Student alloc] init];
    NSLog(@"%@", stu);

    Student *stu2 = [[Student alloc] init];
    NSLog(@"%@", stu2);
    
    return 0;
}
