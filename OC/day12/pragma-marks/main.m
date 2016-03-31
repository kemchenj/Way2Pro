//
//  main.m
//  pragma-marks
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
@end

@implementation Clip
@end


@interface Gun : NSObject
{
    @public
    double _model;
    Clip *_clip;
}
-(void)addClip;
@end

@implementation Gun
-(void)addClip
{
    _clip->_bullet = 30;
}
@end


@interface Soldier : NSObject
{
    NSString *_name;
    double _height;
    double _weight;
}
-(void)shoot: (Gun *) Rifle;
@end

@implementation Soldier
-(void)shoot: (Gun *) Rifle
{
    if (Rifle->_clip->_bullet > 0) {
        Rifle->_clip->_bullet--;
        NSLog(@"子弹射出去了 还剩%i颗", Rifle->_clip->_bullet);
    }else{
        NSLog(@"没子弹了,请换弹夹");
    }
}
@end


int main(int argc, const char * argv[]) {
    Soldier *Terry = [Soldier new];
    Gun *Ak = [Gun new];
    Ak->_clip = [Clip new];
    Ak->_clip->_bullet = 5;
    
    [Terry shoot:Ak];
    [Terry shoot:Ak];
    [Terry shoot:Ak];
    [Terry shoot:Ak];
    [Terry shoot:Ak];
    [Terry shoot:Ak];
    [Terry shoot:Ak];
    [Terry shoot:Ak];
    [Terry shoot:Ak];
    
    return 0;
}
