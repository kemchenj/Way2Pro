//
//  ViewController.m
//  自动释放池大对象问题
//
//  Created by xiaomage on 15/6/26.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*
    // 1.不要再自动释放池中使用比较消耗内存的对象, 占用内存比较大的对象
    @autoreleasepool {
        Person *p = [[[Person alloc] init] autorelease];
        
        // 假如p对象只在100行的地方使用, 以后都不用了
        
        // 一万行代码
    }
     */
    
   
    // 2.尽量不要再自动释放池中使用循环, 特别是循环的次数非常多, 并且还非常占用内存
    @autoreleasepool {
        for (int i = 0; i < 99999; ++i) {
            // 每调用一次都会创建一个新的对象
            // 每个对象都会占用一块存储空间
            Person *p = [[[Person alloc] init] autorelease];
        }
    } // 只有执行到这一行, 所有的对象才会被释放
   
    
    /*
    for (int i = 0; i < 99999; ++i) {
        @autoreleasepool {
             Person *p = [[[Person alloc] init] autorelease];
        } // 执行到这一行, 自动释放池就释放了
    }
     */
    NSLog(@"--------");
}

@end
