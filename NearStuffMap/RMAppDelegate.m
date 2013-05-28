//
//  RMAppDelegate.m
//  NearStuffMap
//
//  Created by Marco S. Graciano on 4/22/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import "RMAppDelegate.h"

#import "RMViewController.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation RMAppDelegate
@synthesize foursquareSwitch, twitterSwitch,instagramSwitch,yelpSwitch, facebookSwitch, socialArrays, fbSearchTerm;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:8 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[RMViewController alloc] initWithNibName:@"RMViewController" bundle:nil];
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    
    foursquareSwitch = YES;
    twitterSwitch = YES;
    instagramSwitch = YES;
    yelpSwitch = YES;
    facebookSwitch = YES;
    
    socialArrays = [[NSMutableArray alloc] init];
    fbSearchTerm = [[NSString alloc] init];
    [self customizeAppearance];
    
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


-(void)customizeAppearance {
    UIImage *toolbarBackground = [UIImage imageNamed:@"bar_grey"];
    [[UIToolbar appearance] setBackgroundImage:toolbarBackground forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    
    UIImage *buttonBackground = [UIImage imageNamed:@"general_button"];
    UIEdgeInsets insets = UIEdgeInsetsMake(buttonBackground.size.height/2, buttonBackground.size.width/2, buttonBackground.size.height/2, buttonBackground.size.width/2);
    buttonBackground = [buttonBackground resizableImageWithCapInsets:insets];
    [[UIBarButtonItem appearance] setBackgroundImage:buttonBackground forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [[UISwitch appearance] setOnImage:[UIImage imageNamed:@"switch_on"]];
    [[UISwitch appearance] setOffImage:[UIImage imageNamed:@"switch_off"]];
    [[UISwitch appearance] setThumbTintColor:[UIColor darkGrayColor]];

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
