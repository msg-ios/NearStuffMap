//
//  RMFacebookDetailViewController.h
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 31/05/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface RMFacebookDetailViewController : UIViewController <UIWebViewDelegate> {
    UIWebView *customWebView;
}

@property (nonatomic, copy) NSString *facebookMobileURLString;

@end
