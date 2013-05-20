//
//  RMSettingsViewController.h
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 20/05/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMSettingsViewController : UIViewController {
    IBOutlet UISwitch *instagramSwitch;
    IBOutlet UISwitch *twitterSwitch;
    IBOutlet UISwitch *yelpSwitch;
    IBOutlet UISwitch *foursquareSwitch;
    IBOutlet UISwitch *facebookSwitch;

}

@property (nonatomic, retain) UISwitch *instagramSwitch;
@property (nonatomic, retain) UISwitch *twitterSwitch;
@property (nonatomic, retain) UISwitch *yelpSwitch;
@property (nonatomic, retain) UISwitch *foursquareSwitch;
@property (nonatomic, retain) UISwitch *facebookSwitch;


-(IBAction)dismissSettingsView;
-(IBAction)toggleSwitchFoursquare;

-(IBAction)toggleSwitchYelp;

-(IBAction)toggleSwitchInstagram;

-(IBAction)toggleSwitchTwitter;

-(IBAction)toggleSwitchFacebook;

@end
