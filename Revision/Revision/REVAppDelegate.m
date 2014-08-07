//
//  REVAppDelegate.m
//  Revision
//
//  Created by JOSH HENDERSHOT on 8/7/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "REVAppDelegate.h"

@implementation REVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.rootViewController = [[UIViewController alloc]init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
