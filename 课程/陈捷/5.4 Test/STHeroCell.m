//
//  STHeroViewTableViewCell.m
//  5.4 Test
//
//  Created by kemchenj on 5/4/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STHeroCell.h"
#import "STHero.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "Masonry/Masonry.h"



@interface STHeroCell ()

@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;
@property (nonatomic, weak) IBOutlet UILabel     *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel     *introLabel;

@end



@implementation STHeroCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;

        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font          = [UIFont systemFontOfSize:20];
        nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [nameLabel sizeToFit];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;

        UILabel *introLabel = [[UILabel alloc] init];
        introLabel.font          = [UIFont systemFontOfSize:16];
        introLabel.textColor     = [UIColor grayColor];
        introLabel.numberOfLines = 0;
        [self.contentView addSubview:introLabel];
        self.introLabel = introLabel;
    }

    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.nameLabel.frame     = self.hero.nameFrame;
    self.introLabel.frame    = self.hero.introFrame;
    self.iconImageView.frame = self.hero.iconFrame;
}

- (void)setHero:(STHero *)hero
{
    _hero = hero;

    self.nameLabel.text      = hero.name;
    self.introLabel.text     = hero.intro;
    self.iconImageView.image = [UIImage imageNamed:hero.icon];
}

@end
