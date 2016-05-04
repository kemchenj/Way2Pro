//
// Created by kemchenj on 5/2/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "STWineCell.h"
#import "STWine.h"



@implementation STWineCell

- (void)setWine:(STWine *)wine
{
    _wine = wine;

    self.textLabel.text       = wine.name;
    self.detailTextLabel.text = wine.money;
    self.imageView.image      = [UIImage imageNamed:wine.image];
}


@end