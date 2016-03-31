//
//  Soldier.h
//  day12
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"

@interface Soldier : NSObject
{
    @public
    NSString *_name;
    double _height;
    double _weight;
}
- (void)fire:(Gun*)gun clip:(Clip*)clip;
@end