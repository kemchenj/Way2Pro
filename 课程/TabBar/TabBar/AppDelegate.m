//
//  AppDelegate.m
//  TabBar
//
//  Created by kemchenj on 5/13/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "AppDelegate.h"
#import "STRedView.h"



@interface AppDelegate ()

@end



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    self.window.rootViewController = tabBarController;

    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor grayColor];
    viewController.tabBarItem.title     = @"Message";
    viewController.tabBarItem.image     = [UIImage imageNamed:@"tab_recent_nor"];
    [tabBarController addChildViewController:viewController];

    UIViewController *viewController1 = [[UIViewController alloc] init];
    viewController1.view.backgroundColor  = [UIColor darkGrayColor];
    viewController1.tabBarItem.title      = @"Contact";
    viewController1.tabBarItem.image      = [UIImage imageNamed:@"tab_buddy_nor"];
    viewController1.tabBarItem.badgeValue = @"99";

    UIView *view = [[STRedView alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
    view.backgroundColor = [UIColor yellowColor];
    [viewController.view addSubview:view];

    [tabBarController addChildViewController:viewController1];

    UIViewController *viewController2 = [[UIViewController alloc] init];
    viewController2.view.backgroundColor = [UIColor lightGrayColor];
    viewController2.tabBarItem.title     = @"test";
    viewController2.tabBarItem.image     = [UIImage imageNamed:@"tab_me_nor"];
    [tabBarController addChildViewController:viewController2];

    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
