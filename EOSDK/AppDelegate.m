//
//  AppDelegate.m
//  EOSDK
//
//  Created by Andrew Kopanev on 1/6/15.
//  Copyright (c) 2015 Moqod. All rights reserved.
//

#import "AppDelegate.h"
#import "EOLoginViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[EOLoginViewController new]];
	[self.window makeKeyAndVisible];
	return YES;
}

@end
