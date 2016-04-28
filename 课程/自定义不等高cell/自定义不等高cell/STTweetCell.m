//
//  STTweetViewTableViewCell.m
//  自定义不等高cell
//
//  Created by kemchenj on 4/28/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STTweetCell.h"
#import "STTweet.h"

#define XMGNameFont [UIFont systemFontOfSize:17]
#define XMGTextFont [UIFont systemFontOfSize:14]

@interface STTweetCell ()

@property (nonatomic, weak) UILabel     *nameLabel;
@property (nonatomic, weak) UILabel     *text_label;
@property (nonatomic, weak) UIImageView *vipImageView;
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UIImageView *pictureImageView;

@end

@implementation STTweetCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        UIImageView *vipImageView = [[UIImageView alloc] init];
        vipImageView.image        = [UIImage imageNamed:@"vip"];
        vipImageView.contentMode  = UIViewContentModeCenter;
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font     = XMGNameFont;
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *text_label      = [[UILabel alloc] init];
        text_label.font          = XMGTextFont;
        text_label.numberOfLines = 0;
        [self.contentView addSubview:text_label];
        self.text_label = text_label;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.nameLabel.frame        = self.tweet.nameFrame;
    self.text_label.frame       = self.tweet.textFrame;
    self.vipImageView.frame     = self.tweet.vipFrame;
    self.iconImageView.frame    = self.tweet.iconFrame;
    self.pictureImageView.frame = self.tweet.pictureFrame;
}

/**
 *  设置子控件显示的数据
 */

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
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image  = [UIImage imageNamed:tweet.picture];
    } else {
        self.pictureImageView.hidden = YES;
    }
}
@end
