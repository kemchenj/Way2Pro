//
// Created by kemchenj on 5/12/16.
// Copyright (c) 2016 ST. All rights reserved.
//

#import "STView.h"



@interface STView ()

@property (nonatomic, weak) IBOutlet UIButton *button;

@end



@implementation STView

- (void)awakeFromNib
{
    NSLog(@"%@", self.button);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"%@", self.button);
    self = [super initWithCoder:aDecoder];
    if (self) {}

    return self;
}


@end