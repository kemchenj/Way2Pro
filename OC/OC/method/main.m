//
//  main.m
//  method
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gun: NSObject
{
    int _size;
    int _bulletCount;
}
- (void)shoot: int _bulletCount;
@end

@interface Soldier : NSObject
{
    NSString _name;
    int lifeLevel;
}
- (void)run;
- (void)jump;
- (void)shoot;
@end

int main(int argc, const char * argv[]) {
    // 1.创建士兵对象
    Soldier *s1 = [Soldier new];
    s1->_name = @"jack";
    s1->_life = 10;
    s1->_level = kSoldierLevel1;
    
    // 2.创建枪对象
    Gun *gun = [Gun new];
    gun0>_bulletCount = 100;
    
    // 3.射击
    [s1 fireGun:gun];
}

@implementation Soldier
-(void)fireByGun:(Gun *)gun
{
    [gun shoot];
}
@end