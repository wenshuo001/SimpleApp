//
//  AppDelegate.m
//  SimpleApp
//
//  Created by Wenshuo on 2020/3/22.
//  Copyright © 2020年 Wenshuo. All rights reserved.
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "LoginViewController.h"
#import "CollectionViewController.h"
#import "GTRecommendViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate
 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
   
         //设置 UIWindow
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds] ];
    // 底部tabbar
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    // 管理 UIViewController 的跳转
    UINavigationController *uinavigatController =[[UINavigationController alloc] initWithRootViewController:tabbar];
    
    GTNewsViewController  *viewController =[[GTNewsViewController alloc] init];
    viewController.view.backgroundColor = [UIColor greenColor];
    viewController.tabBarItem.title = @"首页";
    viewController.tabBarItem.image = [UIImage imageNamed:@"首页1-1"];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:@"首页1"];
   // [viewController.navigationController setNavigationBarHidden:NO];
    
    CollectionViewController  *viewController2 =[[CollectionViewController alloc] init];
     viewController2.view.backgroundColor = [UIColor redColor];
    viewController2.tabBarItem.title = @"订单";
    viewController2.tabBarItem.image = [UIImage imageNamed:@"订单2-1"];
    viewController2.tabBarItem.selectedImage = [UIImage imageNamed:@"订单1"];
   
    
    GTRecommendViewController  *viewController4 = [[GTRecommendViewController alloc] init];
    viewController4.view.backgroundColor = [UIColor greenColor];
    viewController4.tabBarItem.title = @"推荐";
    viewController4.tabBarItem.image = [UIImage imageNamed:@"我的2"];
    viewController4.tabBarItem.selectedImage = [UIImage imageNamed:@"我的2-1"];
    
    [tabbar setViewControllers:@[viewController,viewController2,viewController4]];
    // 可以理解为 tabbar 选项卡的监听
    tabbar.delegate = self;
    //如果要底部不出现 tabbar 必须设置 rootViewController 为 uinavigatController
    self.window.rootViewController = uinavigatController;
    [self.window makeKeyAndVisible];
    return YES;
}

// 配合tabbar.delegate = self;  当点击tabbar 会回调此方法
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select");
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
