//
//  class.m
//  OC
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person: NSObject
{
    @public
    double _age;
    double _weight;
}
- (void)eat: (double)_weight;
- (void)walk: (double)_weight;
@end

@implementation Person
- (void)eat:(double)_weight
{
    _weight = _weight + 0.2;
}

- (void)walk:(double)_weight
{
    _weight = _weight - 0.2;
}
@end