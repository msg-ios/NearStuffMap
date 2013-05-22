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

-(void)viewWillDisappear:(BOOL)animated{
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];

    NSLog(@"ARRAY: %@", app.socialArrays);
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
    if (![foursquareSwitch isOn])
        [app.socialArrays addObject:@"Foursquare"];
    else{
        if ([app.socialArrays containsObject:@"Foursquare"])
            [app.socialArrays removeObject:@"Foursquare"];
    }}

-(IBAction)toggleSwitchYelp{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.yelpSwitch = yelpSwitch.isOn;
    if (![yelpSwitch isOn])
        [app.socialArrays addObject:@"Yelp"];
    else{
        if ([app.socialArrays containsObject:@"Yelp"])
            [app.socialArrays removeObject:@"Yelp"];
    }

}

-(IBAction)toggleSwitchInstagram{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.instagramSwitch = instagramSwitch.isOn;
    if (![instagramSwitch isOn])
        [app.socialArrays addObject:@"Instagram"];
    else{
        if ([app.socialArrays containsObject:@"Instagram"])
            [app.socialArrays removeObject:@"Instagram"];
    }
}

-(IBAction)toggleSwitchTwitter{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.twitterSwitch = twitterSwitch.isOn;
    if (![twitterSwitch isOn])
        [app.socialArrays addObject:@"Twitter"];
    else{
        if ([app.socialArrays containsObject:@"Twitter"])
            [app.socialArrays removeObject:@"Twitter"];
    }
}

-(IBAction)toggleSwitchFacebook{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.facebookSwitch = facebookSwitch.isOn;
    if (![facebookSwitch isOn])
        [app.socialArrays addObject:@"Facebook"];
    else{
        if ([app.socialArrays containsObject:@"Facebook"])
            [app.socialArrays removeObject:@"Facebook"];
    }
}

@end
