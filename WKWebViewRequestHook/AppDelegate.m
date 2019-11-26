//
//  AppDelegate.m
//  WKWebViewRequestHook
//
//  Created by admin on 2019/11/23.
//  Copyright © 2019 sunzhongliang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SZLRequestHook.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    [SZLRequestHook startHook];
    
    return YES;
}

@end
