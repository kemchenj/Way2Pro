//
//  main.m
//  Demo
//
//  Created by xiaomage on 15/6/10.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSArray *arr = @[@1, @99, @88, @23, @66];
    // 88
//    NSLog(@"%@", arr);
//    arr = [arr sortedArrayUsingSelector:@selector(compare:)];
//    NSLog(@"%@", arr);
    NSLog(@"%u", [arr indexOfObject:@88]);
    return 0;
}
