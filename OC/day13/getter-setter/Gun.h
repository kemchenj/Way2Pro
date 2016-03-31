//
//  Gun.h
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gun : NSObject
{
    int _bullet;
    int _size;
    NSString *_model;
    int _color;
    double _weight;
}
-(void)shoot;
-(void)addBullet:(int)count;
-(int)getBullet;
-(void)setSize:(int)size;
-(int)size;

@end
