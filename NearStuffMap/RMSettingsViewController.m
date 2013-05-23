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
}

-(void)viewWillDisappear:(BOOL)animated{
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];

    NSLog(@"ARRAY: %@", app.socialArray);
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
        [app.socialArray addObject:@"Foursquare"];
    else{
        if ([app.socialArray containsObject:@"Foursquare"])
            [app.socialArray removeObject:@"Foursquare"];
    }
    NSLog(@"SOCIAL ARRAY: %@", app.socialArray);
}

-(IBAction)toggleSwitchYelp{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.yelpSwitch = yelpSwitch.isOn;
    if (![yelpSwitch isOn])
        [app.socialArray addObject:@"Yelp"];
    else{
        if ([app.socialArray containsObject:@"Yelp"])
            [app.socialArray removeObject:@"Yelp"];
    }
    NSLog(@"SOCIAL ARRAY: %@", app.socialArray);

}

-(IBAction)toggleSwitchInstagram{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.instagramSwitch = instagramSwitch.isOn;
    if (![instagramSwitch isOn])
        [app.socialArray addObject:@"Instagram"];
    else{
        if ([app.socialArray containsObject:@"Instagram"])
            [app.socialArray removeObject:@"Instagram"];
    }
    NSLog(@"SOCIAL ARRAY: %@", app.socialArray);
}

-(IBAction)toggleSwitchTwitter{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.twitterSwitch = twitterSwitch.isOn;
    if (![twitterSwitch isOn])
        [app.socialArray addObject:@"Twitter"];
    else{
        if ([app.socialArray containsObject:@"Twitter"])
            [app.socialArray removeObject:@"Twitter"];
    }
    NSLog(@"SOCIAL ARRAY: %@", app.socialArray);
}

-(IBAction)toggleSwitchFacebook{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.facebookSwitch = facebookSwitch.isOn;
    if (![facebookSwitch isOn])
        [app.socialArray addObject:@"Facebook"];
    else{
        if ([app.socialArray containsObject:@"Facebook"])
            [app.socialArray removeObject:@"Facebook"];
    }
    NSLog(@"SOCIAL ARRAY: %@", app.socialArray);
}

@end
