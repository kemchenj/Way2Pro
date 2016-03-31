//
//  main.m
//  无参方法
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Iphone : NSObject
{
    @public
    float _model;
    NSString *_cpu;
    double _size;
    NSString *_color;
}
-(void)about;
@end

@implementation Iphone
-(void)about
{
    NSLog(@"\n型号 = %f\ncpu = %@\n尺寸 = %.1f\n颜色 = %@", _model, _cpu, _size, _color);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Iphone *p = [Iphone new];
        p->_color = @"silver";
        p->_cpu = @"A8";
        p->_model = 6;
        p->_size = 4.7;
        
        [p about];
    }
    return 0;
}
