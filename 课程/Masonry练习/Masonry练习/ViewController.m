//
//  ViewController.m
//  Masonry练习
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
        
        make.height.equalTo(60);
    }];
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(blueView.bottom).offset(10);
        make.right.equalTo(blueView.right);
//        make.left.equalTo(blueView.centerX);
        
        make.height.equalTo(blueView.height);
        make.width.equalTo(blueView.width).multipliedBy(0.5);
    }];
}

@end
