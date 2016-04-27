//
//  STShopView.h
//  自定义UIButton
//
//  Created by kemchenj on 4/25/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class STShop;

@interface STShopView : UIButton

@property(nonatomic, weak)STShop *shop;

+(instancetype)shopViewWithShop:(STShop *)shop;
+(instancetype)shopView;

@end
