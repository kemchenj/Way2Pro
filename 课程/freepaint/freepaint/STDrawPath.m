//
// Created by kemchenj on 5/16/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "STDrawPath.h"



@interface STDrawPath ()

@end



@implementation STDrawPath

- (instancetype)initWithLineColor:(UIColor *)lineColor;
{
    self = [super init];
    if (self) {
        self.lineColor = lineColor;
    }

    return self;
}

+ (instancetype)pathWithLineColor:(UIColor *)lineColor;
{
    return [[self alloc] initWithLineColor:lineColor];
}


@end