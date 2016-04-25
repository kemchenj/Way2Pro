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

@property(nonatomic, weak) IBOutlet UIImageView *iconImageView;
@property(nonatomic, weak) IBOutlet UILabel *nameLabel;

@end

@implementation STShopView
- (void)setIcon:(NSString *)icon
{
    self.iconImageView.image = [UIImage imageNamed:icon];
}
- (void)setName:(NSString *)name
{
    self.nameLabel.text = name;
}
- (void)setIcon:(NSString *)icon name:(NSString *)name
{
    self.iconImageView.image = [UIImage imageNamed:icon];
    self.nameLabel.text = name;
}

+ (instancetype)shopView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

+ (instancetype)shopViewWithShop: (STShop *)shop
{
    STShopView *shopView = [self shopView];
    shopView.shop = shop;
    return shopView;
}

-(void)setShop:(STShop *)shop
{
    _shop = shop;
    self.iconImageView.image = [UIImage imageNamed:shop.icon];
    self.nameLabel.text = shop.name;
}

@end
