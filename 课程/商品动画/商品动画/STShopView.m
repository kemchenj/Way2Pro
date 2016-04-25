//
//  STShopView.m
//  商品动画
//
//  Created by kemchenj on 4/23/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STShopView.h"
#import "STShop.h"

@interface STShopView()

@property(nonatomic, weak) UIImageView *iconImageView;
@property(nonatomic, weak) UILabel *nameLabel;

@end

@implementation STShopView

-(STShopView *)init
{
    if (self = [super init]) {
        UIImageView *iconImageView = [[UIImageView alloc] init];
        iconImageView.backgroundColor = [UIColor blueColor];
        [self addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.backgroundColor = [UIColor purpleColor];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat shopW = self.frame.size.width;
    CGFloat shopH = self.frame.size.height;
    self.iconImageView.frame = CGRectMake(0, 0, shopW, shopW);
    self.nameLabel.frame = CGRectMake(0, shopW, shopW, shopH-shopW);
}

-(void)setIcon:(NSString *)icon
{
    self.iconImageView.image = [UIImage imageNamed:icon];
}

-(void)setName:(NSString *)name
{
    self.nameLabel.text = name;
}

-(void)setIcon:(NSString *)icon andName:(NSString *)name
{
    self.iconImageView.image = [UIImage imageNamed:icon];
    self.nameLabel.text = name;
}

-(void)setShop:(STShop *)shop
{
    _shop = shop;
    self.iconImageView.image = [UIImage imageNamed: shop.icon];
    self.nameLabel.text = shop.name;
}

-(instancetype)initWithShop:(STShop *)shop
{
    if (self = [super init]) {
        self.shop = shop;
    }
    return self;
}

+(instancetype)shopViewWithShop:(STShop *)shop;
{
    STShopView *shopView = [[STShopView alloc] initWithShop:shop];
    return shopView;
}

+(instancetype)shopView
{
    STShopView *shopView = [[STShopView alloc] init];
    return shopView;
}

@end
