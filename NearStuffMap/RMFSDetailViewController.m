//
//  RMFSDetailViewController.m
//  NearStuffMap
//
//  Created by Marco Graciano on 5/29/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import "RMFSDetailViewController.h"

@interface RMFSDetailViewController ()

@end

@implementation RMFSDetailViewController
@synthesize fsVenueCanonicalURLString;

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
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.view.backgroundColor = [UIColor blackColor];
    
//    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
//	[self.navigationController.view addSubview:HUD];
//    HUD.delegate = self;
//    HUD.mode = MBProgressHUDModeDeterminate;
    
    //UIWebView setup
    customWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height-44)];
    NSString *urlString = self.fsVenueCanonicalURLString;
    customWebView.delegate = self;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [customWebView loadRequest:request];
    [self.view addSubview:customWebView];
    
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:customWebView animated:YES];
    HUD.dimBackground = YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    //HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [MBProgressHUD hideAllHUDsForView:customWebView animated:YES];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
//    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
//	HUD.mode = MBProgressHUDModeCustomView;
//	[HUD hide:YES afterDelay:2];
    
    [MBProgressHUD hideAllHUDsForView:customWebView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
	//[hud removeFromSuperview];
	//hud = nil;
}



@end
