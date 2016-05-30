//
//  ViewController.m
//  block
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



typedef void(^Myblock)();



@interface ViewController ()

@property (nonatomic, strong) Myblock block;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    int a = 0;

    Myblock myblock = ^{
        NSLog(@"a = %i", a);
    };

    NSLog(@"myblock = %p", myblock);

    self.block = myblock;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    _block();
}


@end
