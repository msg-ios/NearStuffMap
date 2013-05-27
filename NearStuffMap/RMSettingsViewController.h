//
//  RMSettingsViewController.h
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 20/05/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMSettingsViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UISwitch *instagramSwitch;
    IBOutlet UISwitch *twitterSwitch;
    IBOutlet UISwitch *yelpSwitch;
    IBOutlet UISwitch *foursquareSwitch;
    IBOutlet UISwitch *facebookSwitch;

}

@property (nonatomic, strong) UISwitch *instagramSwitch;
@property (nonatomic, strong) UISwitch *twitterSwitch;
@property (nonatomic, strong) UISwitch *yelpSwitch;
@property (nonatomic, strong) UISwitch *foursquareSwitch;
@property (nonatomic, strong) UISwitch *facebookSwitch;
@property (strong, nonatomic) IBOutlet UITextField *searchTermTextField;
@property (strong, nonatomic) IBOutlet UILabel *currentSearchTermLabel;

-(IBAction)backgroundTouched:(id)sender;

-(IBAction)dismissSettingsView;

-(IBAction)toggleSwitchFoursquare;

-(IBAction)toggleSwitchYelp;

-(IBAction)toggleSwitchInstagram;

-(IBAction)toggleSwitchTwitter;

-(IBAction)toggleSwitchFacebook;

@end
