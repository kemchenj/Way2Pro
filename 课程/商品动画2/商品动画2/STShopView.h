//
//  STShopView.h
//  商品动画
//
//  Created by kemchenj on 4/23/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class STShop;

@interface STShopView : UIView

//-(void)setIcon:(NSString *)icon;
//-(void)setName:(NSString *)name;
//-(void)setIcon:(NSString *)icon andName:(NSString *)name;

//-(instancetype)initWithShop:(STShop *)shop;
//+(instancetype)shopViewWithShop:(STShop *)shop;
//+(instancetype)shopView;

@property(nonatomic, strong)STShop *shop;
+ (instancetype)shopView;
+ (instancetype)shopViewWithShop: (STShop *)shop;

@end
