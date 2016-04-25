//
//  ViewController.m
//  商品动画
//
//  Created by kemchenj on 4/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STShop.h"
#import "STShopView.h"

@interface ViewController ()
@property(nonatomic, weak) IBOutlet UIButton *addBtn;
@property(nonatomic, weak) IBOutlet UIButton *removeBtn;
@property(nonatomic, weak) IBOutlet UIView *shopsView;
@property (weak, nonatomic) IBOutlet UILabel *alert;

@property(nonatomic, strong)NSArray *shops;
- (void)showHud:(NSString *)context;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dict = @{@"icon" : @"qianbao", @"name" : @"钱包"};
    STShop *shop = [STShop shopWithDict:dict];
    STShopView  *shopView = [STShopView shopViewWithShop:shop];
    
    shopView.frame = CGRectMake(100, 100, 70, 90);
    [self.view addSubview:shopView];
    self.shopsView = shopView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGRect tempFrame = self.shopsView.frame;
    tempFrame.size.height += 10;
    self.shopsView.frame = tempFrame;
}

- (NSArray *)shops{
    /*
    if(_shops == nil){
        _shops = @[
                           @{
                               @"iconName": @"danjianbao",
                               @"name"    : @"单肩包"
                               },
                           @{
                               @"iconName": @"shuangjianbao",
                               @"name"    : @"双肩包"
                               },
                           @{
                               @"iconName": @"liantiaobao",
                               @"name"    : @"链条包"
                               },
                           @{
                               @"iconName": @"xiekuabao",
                               @"name"    : @"斜挎包"
                               },
                           @{
                               @"iconName": @"shoutibao",
                               @"name"    : @"手提包"
                               },
                           @{
                               @"iconName": @"qianbao",
                               @"name"    : @"钱包"
                               }
                           ];
    }
     */
    
    if (_shops == nil) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"shops" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:plistPath];
        
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
    CGFloat xSpace = (self.shopsView.frame.size.width - 3 * shopW) / (maxCols - 1);
    CGFloat shopX  = (shopW + xSpace) * col;
    
    NSUInteger row = index / maxCols;
    CGFloat ySpace = 20;
    CGFloat shopY  = (shopH + ySpace) * row;
    
    STShopView *shopView = [[STShopView alloc] init];
    shopView.frame       = CGRectMake(shopX, shopY, shopW, shopH);
    [self.shopsView addSubview:shopView];
    
    STShop *shop  = self.shops[index];
    shopView.shop = shop;
    
    self.removeBtn.enabled = YES;
    self.addBtn.enabled    = (self.shopsView.subviews.count < self.shops.count);
    if (self.shopsView.subviews.count == 6) {
        [self showHud:@"Full"];
    }
}

- (IBAction)remove {
    [self.shopsView.subviews.lastObject removeFromSuperview];
    
    self.addBtn.enabled    = YES;
    self.removeBtn.enabled = (self.shopsView.subviews.count > 0);
    
    if (self.shopsView.subviews.count == 0) {
        [self showHud:@"There are not anything can be moved"];
    }
}

- (void)showHud:(NSString *)context
{
    self.alert.text = context;
    [UIView animateWithDuration:1.0 animations:^{
        self.alert.alpha = 1.0;
    }completion:^(BOOL finished){
        [UIView animateWithDuration:1.0 delay:1.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.alert.alpha = 0.0;
        }completion:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
