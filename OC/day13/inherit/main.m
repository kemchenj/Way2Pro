//
//  main.m
//  inherit
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iPhone.h"
#import "Android.h"

int main(int argc, const char * argv[]) {
    iPhone *p = [iPhone new];
    [p signalWithNumber:@"1343244234"];
    
    Android *a = [Android new];
    [a signalWithNumber:@"89843892"];
    
    [iPhone brand];
    [Android brand];
//    brand这个属性是继承过来的(继承链)
//    父类Phone里面的方法可以重写,但属性不能(类方法和对象方法都可以重写)
    
    [p setCpu:100];
    NSLog(@"cpu = %i", [p cpu]);
    return 0;
}
