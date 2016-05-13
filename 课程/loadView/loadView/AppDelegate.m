//
//  AppDelegate.m
//  loadView
//
//  Created by kemchenj on 5/7/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"



@interface AppDelegate ()

@end



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UIViewController *vc = [[ViewController alloc] init];
    vc.view.backgroundColor = [UIColor grayColor];

    self.window.rootViewController = vc;

    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
