//
//  STTweetViewTableViewCell.m
//  自定义不等高cell
//
//  Created by kemchenj on 4/28/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STTweetCell.h"
#import "STTweet.h"

@interface STTweetCell ()

@property (nonatomic, weak) IBOutlet UILabel     *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel     *text_label;
@property (nonatomic, weak) IBOutlet UIImageView *vipImageView;
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;
@property (nonatomic, weak) IBOutlet UIImageView *pictureImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureButtom;

@end

@implementation STTweetCell

//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        
//        UIImageView *iconImageView = [[UIImageView alloc] init];
//        [self.contentView addSubview:iconImageView];
//        self.iconImageView = iconImageView;
//        
//        UIImageView *vipImageView = [[UIImageView alloc] init];
//        vipImageView.image        = [UIImage imageNamed:@"vip"];
//        vipImageView.contentMode  = UIViewContentModeCenter;
//        [self.contentView addSubview:vipImageView];
//        self.vipImageView = vipImageView;
//        
//        UIImageView *pictureImageView = [[UIImageView alloc] init];
//        [self.contentView addSubview:pictureImageView];
//        self.pictureImageView = pictureImageView;
//        
//        UILabel *nameLabel = [[UILabel alloc] init];
//        nameLabel.font     = XMGNameFont;
//        [self.contentView addSubview:nameLabel];
//        self.nameLabel = nameLabel;
//        
//        UILabel *text_label      = [[UILabel alloc] init];
//        text_label.font          = XMGTextFont;
//        text_label.numberOfLines = 0;
//        [self.contentView addSubview:text_label];
//        self.text_label = text_label;
//    }
//    
//    return self;
//}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    self.nameLabel.frame        = self.tweet.nameFrame;
//    self.text_label.frame       = self.tweet.textFrame;
//    self.vipImageView.frame     = self.tweet.vipFrame;
//    self.iconImageView.frame    = self.tweet.iconFrame;
//    self.pictureImageView.frame = self.tweet.pictureFrame;
//}

/**
 *  设置子控件显示的数据
 */

-(void)awakeFromNib
{
    self.text_label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}

- (void)setTweet:(STTweet *)tweet
{
    _tweet = tweet;
    
    self.nameLabel.text      = tweet.name;
    self.text_label.text     = tweet.text;
    self.iconImageView.image = [UIImage imageNamed:tweet.icon];
    
    if (tweet.vip) {
        self.vipImageView.hidden = NO;
        self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        self.vipImageView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    if (tweet.picture) {
//        self.pictureHeight.constant = 100;
//        self.pictureButtom.constant = 10;
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image  = [UIImage imageNamed:tweet.picture];
    } else {
        self.pictureImageView.hidden = YES;
//        self.pictureHeight.constant = 0;
//        self.pictureButtom.constant = 0;
    }
}

-(CGFloat)height
{
    [self layoutIfNeeded];
    
    if (self.tweet.picture) {
        return CGRectGetMaxY(self.pictureImageView.frame) + 10;
    } else {
        return CGRectGetMaxY(self.text_label.frame ) + 10;
    }
}
@end
