//
// Created by kemchenj on 5/8/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "STPeopleNearby.h"
#import "STViewController.h"
#import "STNavigationController.h"



@interface STNavigationController ()

@property (nonatomic, strong) STViewController         *viewController;

@end



@implementation STNavigationController

#pragma mark - <View>

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.viewController.view layoutIfNeeded];
}



#pragma mark - <Object>

+ (instancetype)navigationControllerWithView
{
    STViewController       *viewController       = [[STViewController alloc] init];
    STNavigationController *navigationController = [[STNavigationController alloc] initWithRootViewController:viewController];
    navigationController.viewController = viewController;

    return navigationController;
}




@end