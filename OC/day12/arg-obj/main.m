//
//  main.m
//  arg-obj
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 弹夹
@interface Gun : NSObject
{
    @public
    int _bullet;
}
-(void)shoot;
@end

@implementation Gun
-(void)shoot
{
    if (_bullet > 0) {
        _bullet--;
        NSLog(@"打了一枪,剩余弹药:%i", _bullet);
    }else {
        NSLog(@"没有子弹了, 请换弹夹");
    }
}
@end

#pragma mark - 士兵
@interface Soldier : NSObject
{
    @public
    NSString *_name;
    double _height;
    double _weight;
}
-(void)fire:(Gun *)gun;
@end

@implementation Soldier

-(void)fire:(Gun *)g
{
    [g shoot];
}
@end

#pragma mark - 程序入口
int main(int argc, const char * argv[]) {
    Soldier *sp = [Soldier new];
    sp->_name = @"史泰龙";
    sp->_height = 1.88;
    sp->_weight = 100.0;
    
    Gun *gp = [Gun new];
    gp->_bullet = 4;
    
    [sp fire:gp];
    [sp fire:gp];
    [sp fire:gp];
    [sp fire:gp];
    [sp fire:gp];
    [sp fire:gp];
    
    return 0;
}
