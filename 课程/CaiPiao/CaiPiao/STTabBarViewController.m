//
//  STTabBarViewController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STTabBarViewController.h"
#import "STTabBar.h"
#import "STHallViewController.h"
#import "STArenaViewController.h"
#import "STArenaNavigationController.h"
#import "STDiscoverTableViewController.h"
#import "STHistoryViewController.h"
#import "STMyLotteryViewController.h"
#import "STNavigationController.h"



@interface STTabBarViewController () <STTabBarDelegate, UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end



@implementation STTabBarViewController

- (NSMutableArray *)items;
{
    if (!_items) {
        _items = [NSMutableArray array];
    }

    return _items;
}



#pragma mark - <UIView>

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupAllChildViewController];
    [self setupTabBar];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *childView in self.tabBar.subviews) {
        if ([childView isKindOfClass:[STTabBar class]] == NO) {
            [childView removeFromSuperview];
        }
    }
}


#pragma mark - <TabBar Thing>

- (void)setupTabBar;
{
    STTabBar *tabBar = [[STTabBar alloc] init];

    tabBar.delegate        = self;
    tabBar.items           = self.items;
    tabBar.frame           = self.tabBar.bounds;
    tabBar.backgroundColor = [UIColor redColor];

    [self.tabBar addSubview:tabBar];
}

- (void)tabBar:(STTabBar *)tabBar didClickButton:(NSInteger)index;
{
    self.selectedIndex = index;
}



#pragma mark - <初始化设置>

- (void)setupAllChildViewController;
{
    STHallViewController *hallViewController = [[STHallViewController alloc] init];
    [self setupOneChildViewController:hallViewController
                                image:[UIImage imageNamed:@"TabBar_LotteryHall_new"]
                             selImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"]
                                title:@"购彩大厅"
    ];

    STArenaViewController *arenaViewController = [[STArenaViewController alloc] init];
    [self setupOneChildViewController:arenaViewController
                                image:[UIImage imageNamed:@"TabBar_Arena_new"]
                             selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]
                                title:nil
    ];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"STDiscoverTableViewController"
                                                         bundle:nil
    ];
    STDiscoverTableViewController *discoverTableViewController = [storyboard instantiateInitialViewController];
    [self setupOneChildViewController:discoverTableViewController
                                image:[UIImage imageNamed:@"TabBar_Discovery_new"]
                             selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"]
                                title:@"发现"
    ];

    STHistoryViewController *historyViewController = [[STHistoryViewController alloc] init];
    [self setupOneChildViewController:historyViewController
                                image:[UIImage imageNamed:@"TabBar_History_new"]
                             selImage:[UIImage imageNamed:@"TabBar_History_selected_new"]
                                title:@"开奖信息"
    ];

    STMyLotteryViewController *lotteryViewController = [[STMyLotteryViewController alloc] init];
    self.image = [UIImage imageNamed:@"TabBar_MyLottery_new"];
    [self setupOneChildViewController:lotteryViewController
                                image:self.image
                             selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"]
                                title:@"我的彩票"
    ];
}

- (void)setupOneChildViewController:(UIViewController *)controller image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title;
{
    UINavigationController *navigationController = [[STNavigationController alloc] initWithRootViewController:controller];

    if ([controller isKindOfClass:[STArenaViewController class]]) {
        navigationController = [[STArenaNavigationController alloc] initWithRootViewController:controller];
    }

    navigationController.tabBarItem.image         = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationController.tabBarItem.selectedImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    controller.title = title;

    [self.items addObject:navigationController.tabBarItem];

    [self addChildViewController:navigationController];
}


@end
