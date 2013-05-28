//
//  RMAppDelegate.h
//  NearStuffMap
//
//  Created by Marco S. Graciano on 4/22/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RMViewController;

@interface RMAppDelegate : UIResponder <UIApplicationDelegate, UIAppearanceContainer>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navController;

@property (strong, nonatomic) RMViewController *viewController;

@property (strong, nonatomic) NSMutableArray *socialArrays;

@property (strong, nonatomic) NSString *fbSearchTerm;

@property BOOL foursquareSwitch;
@property BOOL twitterSwitch;
@property BOOL yelpSwitch;
@property BOOL instagramSwitch;
@property BOOL facebookSwitch;

@end
