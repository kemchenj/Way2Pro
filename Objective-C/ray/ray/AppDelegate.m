//
//  AppDelegate.m
//  ray
//
//  Created by kemchenj on 4/7/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    enum{
//        VideoGameTypeRPG,
//        VideoGameTypeStrategy,
//        VideoGameTypeAction,
//        VideoGameTypeFPS
//    };
//    typedef long long VideoGameType;
    
    
    typedef NS_ENUM(long long, VideoGameType){
        VideoGameTypeRPG,
        VideoGameTypeStrategy,
        VideoGameTypeAction,
        VideoGameTypeFPS
    };
    // 把enum和typedef两步合并为一步
    // 本质上NS_ENUM是通过宏定义来替换成上面的形式的
    
    VideoGameType type = VideoGameTypeRPG;
    NSLog(@"Sizeof type: %lu Value:%lld", sizeof(type), type);
    
    switch(type){
        case VideoGameTypeRPG:
            NSLog(@"RPG");
            break;
            
        default:
            NSLog(@"default");
            break;
    }
    
//    enum{
//        EntityCategoryPlayer = 1<<0,
//        EntityCategoryEnemy  = 1<<1,
//        EntityCategoryAlien  = 1<<2,
//        EntityCategoryET     = 1<<3
//    };
//    typedef int EntityCategory;
    
    typedef NS_OPTIONS(int, EntityCategory){
        EntityCategoryPlayer = 1<<0, // bits: 0001
        EntityCategoryEnemy  = 1<<1, // bits: 0010
        EntityCategoryAlien  = 1<<2, // bits: 0100
        EntityCategoryET     = 1<<3  // bits: 1000
    };
    
    EntityCategory category = EntityCategoryEnemy | EntityCategoryAlien; // bits: 0110
    if (category &EntityCategoryPlayer) {
        NSLog(@"Player!");
    }
    if (category &EntityCategoryAlien) {
        NSLog(@"Alien!");
    }
    if (category &EntityCategoryEnemy) {
        NSLog(@"Enemy!");
    }
    // 进行按位掩码之后, 逻辑判断会变得更加容易操作
    
    NSLog(@"%x", EntityCategoryPlayer);
    NSLog(@"%x", EntityCategoryEnemy);
    NSLog(@"%x", EntityCategoryAlien);
    NSLog(@"%x", EntityCategoryET);
    NSLog(@"%x", category);

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
