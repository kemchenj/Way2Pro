//
//  ViewController.m
//  商品动画2
//
//  Created by kemchenj on 4/23/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STShop.h"
#import "STShopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dict = @{@"icon" : @"qianbao", @"name" : @"钱包"};
    STShop *shop       = [STShop shopWithDict:dict];
    
    STShopView *shopView = [STShopView shopViewWithShop:shop];
    shopView.center      = CGPointMake(200, 200);
    [self.view addSubview:shopView];
}

- (void)xibSize
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"test" owner:nil options:nil];
    UIView *view   = array.firstObject;
    view.center    = CGPointMake(200, 200);
    
    [self.view addSubview:view];
}

- (void)testXib
{
    UINib *nib = [UINib nibWithNibName:@"test" bundle:nil];
    NSArray *arr = [nib instantiateWithOwner:nil options:nil];
    UIView *view = arr.firstObject;
    [self.view addSubview:view];
}

@end
