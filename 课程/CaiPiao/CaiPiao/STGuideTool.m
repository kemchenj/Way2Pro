//
//  STGuideTool.m
//  CaiPiao
//
//  Created by kemchenj on 5/23/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STGuideTool.h"
#import "STSaveTool.h"
#import "STTabBarViewController.h"
#import "STNewFeatureViewController.h"
#import "STArrowItem.h"



#define STUserDefaults [NSUserDefaults standardUserDefaults]
#define STVersionKey @"curVersion"

@interface STGuideTool()

@property (nonatomic, strong) UIImage *image;

@end


@implementation STGuideTool

+ (UIViewController *)chooseRootViewController;
{
    STArrowItem *item = [[STArrowItem alloc] init];

    UIViewController *controller = nil;

    NSDictionary *dictionary = [NSBundle mainBundle].infoDictionary;

    UIImage *image = [UIImage imageNamed:@"arrow_right@2x.png"];

    NSString *curVersion = dictionary[@"CFBundleShortVersionString"];

    NSString *lastVersion = [STSaveTool objectForKey:STVersionKey];

    if ([curVersion isEqualToString:lastVersion]) {
        controller = [[STTabBarViewController alloc] init];
    } else {
        [STSaveTool setObject:curVersion forKey:STVersionKey];
        controller = [[STNewFeatureViewController alloc] init];
    }

    return controller;
}

@end
