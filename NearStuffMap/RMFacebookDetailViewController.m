//
//  RMFacebookDetailViewController.m
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 31/05/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import "RMFacebookDetailViewController.h"

@interface RMFacebookDetailViewController ()

@end

@implementation RMFacebookDetailViewController
@synthesize facebookMobileURLString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tileable_wood_texture"]];
    
    //UIWebView setup
    customWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height-44)];
    NSString *urlString = self.facebookMobileURLString;
    customWebView.delegate = self;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [customWebView loadRequest:request];
    [self.view addSubview:customWebView];
    
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:customWebView animated:YES];
    HUD.dimBackground = YES;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [MBProgressHUD hideAllHUDsForView:customWebView animated:YES];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideAllHUDsForView:customWebView animated:YES];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
