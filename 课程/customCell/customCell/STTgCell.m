//
//  STTgCellTableViewCell.m
//  customCell
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STTgCell.h"
#import "STTg.h"

//#define MAS_SHORTHAND
//#define MAS_SHORTHAND_GLOBALS
//#import "Masonry/Masonry.h"

@interface STTgCell ()

@property(nonatomic, weak) IBOutlet UILabel     *titleLabel;
@property(nonatomic, weak) IBOutlet UILabel     *priceLabel;
@property(nonatomic, weak) IBOutlet UILabel     *buyCountLabel;
@property(nonatomic, weak) IBOutlet UIImageView *iconImageView;

@end



@implementation STTgCell

- (void)setTg:(STTg *)tg
{
    _tg = tg;

    self.titleLabel.text     = tg.title;
    self.priceLabel.text     = [NSString stringWithFormat:@"%@", tg.price];
    self.buyCountLabel.text  = [NSString stringWithFormat:@"%@人已购买", tg.buyCount];
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
}

@end
