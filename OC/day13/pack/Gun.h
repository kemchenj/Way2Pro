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
}
-(void)shoot;
-(void)addBullet:(int)count;
-(int)getBullet;
@end