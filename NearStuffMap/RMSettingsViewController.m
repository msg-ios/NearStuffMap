//
//  RMSettingsViewController.m
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 20/05/13.
//  Copyright (c) 2013 Marco Graciano & Ramiro Guerrero. All rights reserved.
//

#import "RMSettingsViewController.h"
#import "RMAppDelegate.h"
#import "RMAboutVC.h"
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
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"dark_wood"]]];
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    foursquareSwitch.on = app.foursquareSwitch;
    twitterSwitch.on = app.twitterSwitch;
    instagramSwitch.on = app.instagramSwitch;
    yelpSwitch.on = app.yelpSwitch;
    facebookSwitch.on = app.facebookSwitch;
    self.searchTermTextField.delegate = self;
    self.currentSearchTermLabel.text = app.fbSearchTerm;
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

-(IBAction)backgroundTouched:(id)sender {
    [self.searchTermTextField resignFirstResponder];
}

-(IBAction)dismissSettingsView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([self.searchTermTextField.text isEqualToString:@""] || [self.searchTermTextField.text isEqualToString:@" "]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You must enter a search term to change it." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
        app.fbSearchTerm = self.searchTermTextField.text;
        self.currentSearchTermLabel.text = app.fbSearchTerm;
    }

    [textField resignFirstResponder];
    return YES;
}

-(IBAction)toggleSwitchFoursquare{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.foursquareSwitch = foursquareSwitch.isOn;
    if (![foursquareSwitch isOn])
        [app.socialArrays addObject:@"Foursquare"];
    else{
        if ([app.socialArrays containsObject:@"Foursquare"])
            [app.socialArrays removeObject:@"Foursquare"];
    }
    NSLog(@"SOCIAL ARRAY: %@", app.socialArrays);
}

-(IBAction)toggleSwitchYelp{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
    app.yelpSwitch = yelpSwitch.isOn;
    if (![yelpSwitch isOn])
        [app.socialArrays addObject:@"Yelp"];
    else{
        if ([app.socialArrays containsObject:@"Yelp"])
            [app.socialArrays removeObject:@"Yelp"];
    }
    NSLog(@"SOCIAL ARRAY: %@", app.socialArrays);

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
    NSLog(@"SOCIAL ARRAY: %@", app.socialArrays);
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
    NSLog(@"SOCIAL ARRAY: %@", app.socialArrays);
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
    NSLog(@"SOCIAL ARRAY: %@", app.socialArrays);
}

-(IBAction)createAndLoadAboutVC{
    RMAboutVC *aboutVC = [[RMAboutVC alloc ] init];
    
    [self presentViewController:aboutVC animated:YES completion:nil];
}

@end
