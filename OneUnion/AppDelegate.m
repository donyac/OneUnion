//
//  AppDelegate.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/25.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    MainViewController *mainVC = [[MainViewController alloc]init];
    self.window.rootViewController = mainVC;
    
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
