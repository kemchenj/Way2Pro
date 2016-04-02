//
//  Tire.h
//  day15
//
//  Created by xmg on 3/28/16.
//  Copyright © 2016 xmg. All rights reserved.
//

@interface Tire : NSObject <NSCopying>

@property float pressure;
@property float treadDepth;

-(id) initWithPressure: (float) pressure treadDepth:(float)treadDepth;
-(id) initWithTreadDepth: (float) treadDepth;
-(id) initWithPressure: (float) pressure;

@end