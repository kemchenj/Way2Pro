//
// Created by kemchenj on 5/11/16.
// Copyright (c) 2016 ST. All rights reserved.
//

#import "STPerson.h"
#import "STDog.h"



@interface STPerson ()

@end



@implementation STPerson

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.dog forKey:@"dog"];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeInteger:self.age forKey:@"age"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [self init]) {
        self.dog  = [coder decodeObjectForKey:@"dog"];
        self.name = [coder decodeObjectForKey:@"name"];
        self.age  = [coder decodeIntegerForKey:@"age"];
    }

    return self;
}


@end