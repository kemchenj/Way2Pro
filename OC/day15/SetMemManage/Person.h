//
//  Person.h
//  day15
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"

@interface Person : NSObject
{
    Room *_room;
}

-(void)setRoom:(Room *)room;
-(Room *)room;
@end
