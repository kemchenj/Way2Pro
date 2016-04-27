//
//  ViewController.m
//  自定义UIButton
//
//  Created by kemchenj on 4/25/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STShop.h"
#import "STShopView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;
@property (weak, nonatomic) IBOutlet UIView *shopsView;
@property (weak, nonatomic) IBOutlet UILabel *HudLabel;

@property (strong, nonatomic) NSArray *shops;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shopsView.clipsToBounds = YES;
    
    self.HudLabel.alpha = 0.0;
    self.HudLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
}

-(NSArray *)shops
{
    if (_shops == nil) {
        NSString *pListPath = [[NSBundle mainBundle] pathForResource:@"shops" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:pListPath];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            STShop *shop = [STShop shopWithDict:dict];
            [tempArray addObject:shop];
        }
        
        _shops = tempArray;
    }
    return _shops;
}

- (IBAction)add {
    int maxCols      = 3;
    CGFloat shopW    = 70;
    CGFloat shopH    = 90;
    NSUInteger index = self.shopsView.subviews.count;
    
    
    NSUInteger col = index % maxCols;
    CGFloat xSpace = (self.shopsView.frame.size.width - maxCols * shopW) / (maxCols - 1);
    CGFloat shopX  = (shopW + xSpace) * col;
    
    
    NSUInteger row = index / maxCols;
    CGFloat ySpace = 20;
    CGFloat shopY  = (shopH + ySpace) * row;
    
    
    STShopView *shopView = [STShopView shopView];
    shopView.frame       = CGRectMake(shopX, shopY, shopW, shopH);
    [self.shopsView addSubview:shopView];
    
    STShop *shop  = self.shops[index];
    shopView.shop = shop;
    self.removeBtn.enabled = YES;
    self.addBtn.enabled    = (self.shopsView.subviews.count < self.shops.count);
    
    if (self.addBtn.enabled == NO) {
        [self showHUD:@"不能再添加了!"];
    }
}

#pragma mark - 删除商品
- (IBAction)remove {
    
    [self.shopsView.subviews.lastObject removeFromSuperview];
    
    self.addBtn.enabled = YES;
    self.removeBtn.enabled = (self.shopsView.subviews.count > 0);
    
    if (self.removeBtn.enabled == NO) {
        [self showHUD:@"不能再删除了!"];
    }
}

#pragma mark - 执行动画的代码
- (void)showHUD:(NSString *)text
{
    self.HudLabel.text = text;
    [UIView animateWithDuration:1.0 animations:^{
        self.HudLabel.alpha = 1.0; // 完全不透明
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:1.5 options:kNilOptions animations:^{
            self.HudLabel.alpha = 0.0;
        } completion:nil];
     }];
}

@end
