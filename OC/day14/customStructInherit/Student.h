//
//  Student.h
//  day14
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "Person.h"

@interface Student : Person

@property int no;

-(instancetype)initWithAge:(int)age andName:(NSString *)name andNo:(int)no;

@end