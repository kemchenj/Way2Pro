//
//  STWineCell.m
//  购物车
//
//  Created by kemchenj on 4/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STWineCell.h"
#import "STCircleButton.h"
#import "STWine.h"

@interface STWineCell ()

@property (nonatomic, weak) IBOutlet UILabel        *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel        *countLabel;
@property (nonatomic, weak) IBOutlet UILabel        *moneyLabel;
@property (nonatomic, weak) IBOutlet UIImageView    *imageImageView;
@property (nonatomic, weak) IBOutlet STCircleButton *minusButton;

@end



@implementation STWineCell

-(void)setWine:(STWine *)wine
{
    _wine = wine;

    self.nameLabel.text       = wine.name;
    self.moneyLabel.text      = wine.money;
    self.countLabel.text      = [NSString stringWithFormat:@"%d", wine.count];
    self.minusButton.enabled  = (wine.count > 0);
    self.imageImageView.image = [UIImage imageNamed:wine.image];
}

-(IBAction) plusClick
{
    self.wine.count++;

    self.countLabel.text     = [NSString stringWithFormat:@"%d", self.wine.count];
    self.minusButton.enabled = YES;

    if ([self.delegate respondsToSelector:@selector(wineCellDidClickPlusButton:)]) {
        [self.delegate wineCellDidClickPlusButton:self];
    }
}

-(IBAction) minusClick
{
    self.wine.count--;

    self.countLabel.text = [NSString stringWithFormat:@"%d", self.wine.count];

    if (self.wine.count == 0){
        self.minusButton.enabled = NO;
    }

    if ([self.delegate respondsToSelector:@selector(wineCellDidClickMinusButton:)]) {
        [self.delegate wineCellDidClickMinusButton:self];
    }
}

@end
