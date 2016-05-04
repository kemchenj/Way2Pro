//
//  STHeroCell.m
//  ttttttt
//
//  Created by kemchenj on 5/3/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STHeroCell.h"
#import "STHero.h"

@interface STHeroCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;

@end


@implementation STHeroCell

//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        UIImageView *iconImageView = [[UIImageView alloc] init];
//        self.iconImageView = iconImageView;
//        
//        UILabel *nameLabel = [[UILabel alloc] init];
//        self.nameLabel = nameLabel;
//        
//        UILabel *introLabel = [[UILabel alloc] init];
//        self.introLabel = introLabel;
//    }
//    return self;
//}

-(void)setHero:(STHero *)hero
{
    _hero = hero;
    
    self.nameLabel.text      = hero.name;
    self.introLabel.text     = hero.intro;
    self.iconImageView.image = [UIImage imageNamed:hero.icon];
}

@end
