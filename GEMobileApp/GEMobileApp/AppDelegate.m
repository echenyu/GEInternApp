//
//  AppDelegate.m
//  GEMobileApp
//
//  Created by Eric Yu on 6/30/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@import GoogleMaps;

@interface AppDelegate ()

@end

@implementation AppDelegate

//A lot of stuff is done here to setup the various SDK's and APIs that we're using for this application
//ALso checks to see if a PFUser is currently logged in. If so, we don't need to send them to the login screen. 
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [GMSServices provideAPIKey:@"AIzaSyD5ozwHlFKROIb0eKU4lV-tJvhdkUy9dPI"];
    [Parse setApplicationId:@"ctvsaP9fdLmpgi5OlE7qJf4Zu1zh5lThoCWooSyi"
                  clientKey:@"GJM1loSMOB9NF6ZLkMiC4YlIjONLnQ4LKNOihuNf"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    if(![PFUser currentUser]) {
        [self showLoginScreen:NO];
    }
    return YES;
}

-(void) showLoginScreen:(BOOL)animated
{
    
    // Get login screen from storyboard and present it
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *viewController = (UINavigationController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
    [self.window makeKeyAndVisible];
    [self.window.rootViewController presentViewController:viewController
                                                 animated:animated
                                               completion:nil];
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
