//
//  STShopView.m
//  自定义UIButton
//
//  Created by kemchenj on 4/25/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STShopView.h"
#import "STShop.h"

@implementation STShopView

+(instancetype)shopViewWithShop:(STShop *)shop
{
    STShopView *shopView = [self shopView];
    shopView.shop = shop;
    return shopView;
}

+(instancetype)shopView
{
    return [[self alloc] init];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.enabled = NO;
        self.adjustsImageWhenDisabled = NO;
    }
    return self;
}

-(void)setShop:(STShop *)shop
{
    _shop = shop;
    [self setImage:[UIImage imageNamed:shop.icon] forState:UIControlStateNormal];
    [self setTitle:shop.name forState:UIControlStateNormal];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat imageW = self.frame.size.width;
    CGFloat imageH = imageW;
    self.imageView.frame = CGRectMake(0, 0, imageW, imageH);
    
    CGFloat titleW = imageW;
    CGFloat titleH = self.frame.size.height - imageH;
    self.titleLabel.frame = CGRectMake(0, imageH, titleW, titleH);
}


@end
