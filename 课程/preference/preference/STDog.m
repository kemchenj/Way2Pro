//
// Created by kemchenj on 5/12/16.
// Copyright (c) 2016 ST. All rights reserved.
//

#import "STDog.h"



@interface STDog ()

@end



@implementation STDog

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [self init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }

    return self;
}

@end