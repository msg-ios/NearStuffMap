//
//  RMSettingsViewController.m
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 20/05/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import "RMSettingsViewController.h"
#import "RMAppDelegate.h"
@interface RMSettingsViewController ()

@end

@implementation RMSettingsViewController
@synthesize instagramSwitch, foursquareSwitch, yelpSwitch, twitterSwitch, facebookSwitch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];

    foursquareSwitch.on = app.foursquareSwitch;
    twitterSwitch.on = app.twitterSwitch;
    instagramSwitch.on = app.instagramSwitch;
    yelpSwitch.on = app.yelpSwitch;
    facebookSwitch.on = app.facebookSwitch;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dismissSettingsView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)toggleSwitchFoursquare{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.foursquareSwitch = foursquareSwitch.isOn;
}

-(IBAction)toggleSwitchYelp{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.yelpSwitch = yelpSwitch.isOn;
}

-(IBAction)toggleSwitchInstagram{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.instagramSwitch = instagramSwitch.isOn;
}

-(IBAction)toggleSwitchTwitter{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.twitterSwitch = twitterSwitch.isOn;
}

-(IBAction)toggleSwitchFacebook{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.facebookSwitch = facebookSwitch.isOn;
}

@end
