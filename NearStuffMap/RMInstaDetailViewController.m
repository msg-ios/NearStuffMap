//
//  RMInstaDetailViewController.m
//  NearStuffMap
//
//  Created by Marco Graciano on 5/27/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import "RMInstaDetailViewController.h"

@interface RMInstaDetailViewController ()

@end

@implementation RMInstaDetailViewController
@synthesize photo, filterString, mediaIdString, fullNameString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    //setup of UILabel
    UILabel *fullNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 40, 300, 30)];
    [fullNameLabel setCenter:CGPointMake(self.view.frame.size.width/2.0f, 60)];
    fullNameLabel.shadowColor = [UIColor darkGrayColor];
    fullNameLabel.shadowOffset = CGSizeMake(1.0f, 1.0f);
    fullNameLabel.backgroundColor = [UIColor clearColor];
    fullNameLabel.textAlignment = NSTextAlignmentCenter;
    fullNameLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    fullNameLabel.text = [NSString stringWithFormat:@"User: %@", fullNameString];
    
    [self.view addSubview:fullNameLabel];
    
    //setup of UIImageView
    UIImageView *instaPhotoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 75, 300, 300)];
    instaPhotoImageView.image = photo;
    
    //UIImageView shadow
    instaPhotoImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    instaPhotoImageView.layer.shadowOpacity = 0.7f;
    instaPhotoImageView.layer.shadowOffset = CGSizeMake(6.0f, 6.0f);
    instaPhotoImageView.layer.shadowRadius = 5.0f;
    instaPhotoImageView.layer.masksToBounds = NO;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:instaPhotoImageView.bounds];
    instaPhotoImageView.layer.shadowPath = path.CGPath;
    
    [self.view addSubview:instaPhotoImageView];
    
    //setup of UILabel
    UILabel *filterLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 385, 300, 30)];
    filterLabel.shadowColor = [UIColor darkGrayColor];
    filterLabel.shadowOffset = CGSizeMake(1.0f, 1.0f);
    filterLabel.backgroundColor = [UIColor clearColor];
    filterLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    if (filterString != (NSString *)[NSNull null]) {
        filterLabel.text = [NSString stringWithFormat:@"Filter: %@", filterString];;
    }
    else filterLabel.text = @"Filter: None";
    
    [self.view addSubview:filterLabel];
    
    //setup of UIButton
    UIButton *openInAppButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    openInAppButton.frame = CGRectMake(10, 420, 200, 35);
    [openInAppButton setTitle:@"Open in Instagram app" forState:UIControlStateNormal];
    [openInAppButton addTarget:self action:@selector(openInInstaAppAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *buttonBackground = [UIImage imageNamed:@"general_button"];
    UIEdgeInsets insets = UIEdgeInsetsMake(buttonBackground.size.height/2, buttonBackground.size.width/2, buttonBackground.size.height/2, buttonBackground.size.width/2);
    buttonBackground = [buttonBackground resizableImageWithCapInsets:insets];
    [openInAppButton setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    [openInAppButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:openInAppButton];
    
}

-(void)openInInstaAppAction {
    
    NSString *urlString = [NSString stringWithFormat:@"instagram://media?id=%@", mediaIdString];
    NSLog(@"button pushed. URL: %@", urlString);
    NSURL *instagramURL = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Instagram app is not installed." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tileable_wood_texture"]];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
