//
//  main.m
//  Block的使用
//
//  Created by 小瓶盖 on 15/11/7.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>
void(^printMessage)() = ^(void){
            
         NSLog(@"小白真的超级帅哦!");
            
        };
//   printMessage();


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //定义一个block,
        
     
       
       //调用block
        printMessage();
    }
    return 0;
}
