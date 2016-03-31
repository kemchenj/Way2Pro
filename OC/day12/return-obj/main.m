//
//  main.m
//  return-obj
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

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


@interface Gun : NSObject
{
    Clip *clip;
}
-(void)shoot:(Clip *) c;
@end

@implementation Gun

- (void)shoot:(Clip *)c
{
    if (c != nil) {
        if (c->_bullet>0) {
            c->_bullet -=1;
            NSLog(@"打了一枪 %i", c->_bullet);
        }else{
            NSLog(@"没有子弹了");
        }
    }else{
        NSLog(@"没有子弹了");
    }
}
@end

@interface Soldier : NSObject
{
    @public
    NSString *_name;
    double _height;
    double _weight;
}
-(void)fire:(Gun *)gun clip:(Clip *)clip;
@end

@implementation Soldier
-(void)fire:(Gun *)gun clip:(Clip *)clip
{
    if (gun != nil && clip != nil) {
        [gun shoot:clip];
    }
}
@end

@interface Shop : NSObject
+(Gun*)buyGun:(int)money;
+(Clip*)buyClip:(int)money;
@end

@implementation Shop
+(Gun *)buyGun:(int)money
{
    Gun *gun = [Gun new];
    return gun;
}
+(Clip *)buyClip:(int)money
{
    Clip *clip = [Clip new];
    [clip addBullet];
    return clip;
}
@end

int main(int argc, const char * argv[]) {
    Soldier *sp = [Soldier new];
    sp->_name = @"史泰龙";
    sp->_height = 1.88;
    sp->_weight = 100.0;
    
    Gun *gp = [Shop buyGun:888];
    
    Clip *clip = [Shop buyClip:100];
    
    [sp fire:gp clip:clip];
    
    return 0;
}
