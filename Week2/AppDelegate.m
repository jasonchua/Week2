//
//  AppDelegate.m
//  Week2
//
//  Created by Jason Chua on 6/14/14.
//  Copyright (c) 2014 Jason. All rights reserved.
//

#import "AppDelegate.h"
#import "FeedViewController.h"
#import "DummyViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    FeedViewController *rvc = [[FeedViewController alloc]init];
    rvc.title = @"News Feed";
    rvc.tabBarItem.image = [UIImage imageNamed:@"nb-newsfeed-off.png"];
    
    //set feed view controller as root of uinav controller
    UINavigationController *feedNav = [[UINavigationController alloc]initWithRootViewController:rvc];
    
    DummyViewController *requests = [[DummyViewController  alloc] init];
    requests.title = @"Requests";
    requests.tabBarItem.image = [UIImage imageNamed:@"nb-request-off.png"];
    
    DummyViewController *messages = [[DummyViewController  alloc] init];
    messages.title = @"Messages";
    messages.tabBarItem.image = [UIImage imageNamed:@"comment-off.png"];
    
    DummyViewController *notifications = [[DummyViewController  alloc] init];
    notifications.title = @"Notifications";
    notifications.tabBarItem.image = [UIImage imageNamed:@"nb-notifications-off.png"];
    
    DummyViewController *more = [[DummyViewController  alloc] init];
    more.title = @"More";
    more.tabBarItem.image = [UIImage imageNamed:@"nb-more-off.png"];
    
    // Create the tab bar controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[feedNav, requests, messages, notifications, more];
    self.window.rootViewController = tabBarController;
    
    

    //color of status bar text
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[UINavigationBar appearance]
     setBarTintColor:[UIColor colorWithRed:0.2118 green:0.3686 blue:0.5686 alpha:1.0000]];

    NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                          NSFontAttributeName: [UIFont boldSystemFontOfSize:14]};
    [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttributes];
    
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
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
