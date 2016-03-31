//
//  Gun.h
//  day12
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"
#import "Clip.h"

@interface Gun : NSObject
{
    Clip* clip;
}
-(void)shoot:(Clip*)c;

@end