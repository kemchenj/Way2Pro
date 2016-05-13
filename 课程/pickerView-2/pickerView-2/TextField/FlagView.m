//
// Created by kemchenj on 5/7/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "FlagView.h"
#import "Flag.h"



@interface FlagView ()

@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UILabel     *countryNameLabel;

@end



@implementation FlagView

- (void)setFlag:(Flag *)flag
{
    _flag = flag;

    _countryNameLabel.text = flag.name;
    _flagImageView.image   = [UIImage imageNamed:flag.icon];
}

+ (instancetype)flagView
{
    NSArray *temp = [[NSBundle mainBundle] loadNibNamed:@"FlagView"
                                                  owner:nil
                                                options:nil];
    return [temp lastObject];
}


@end