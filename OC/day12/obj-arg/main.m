//
//  main.m
//  obj-arg
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 弹夹
@interface Clip : NSObject
{
    @public
    int _bullet;
}
-(void)addBullet;
@end

@implementation Clip
-(void)addBullet
{
    _bullet = 10;
}
@end


#pragma mark - 枪
@interface Gun : NSObject
{
    Clip *clip;
}
-(void)shoot: (Clip*)c;
@end

@implementation Gun
-(void)shoot:(Clip *)c
{
    if (c != nil) {
        if (c->_bullet > 0) {
            c->_bullet--;
            NSLog(@"打了一枪 %i", c->_bullet);
        }else{
            NSLog(@"没有子弹了");
        }
    }
}
@end


# pragma mark - 士兵
@interface Soldier : NSObject
{
    @public
    NSString *_name;
    double _height;
    double _weight;
}
-(void)fire:(Gun*)gun clip:(Clip *)clip;
@end

@implementation Soldier

-(void)fire:(Gun *)gun clip:(Clip *)clip
{
    if (gun != nil && clip != nil) {
        [gun shoot:clip];
    }
}
@end

# pragma mark - 程序入口
int main(int argc, const char * argv[]) {
    Soldier *sp = [Soldier new];
    sp->_name = @"史泰龙";
    sp->_height = 1.88;
    sp->_weight = 100.0;
    
    Gun *gp = [Gun new];
    Clip *clip = [Clip new];
    [clip addBullet];
    
    [sp fire:gp clip:clip];
    return 0;
}
