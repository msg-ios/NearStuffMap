//
//  RMYelpDetailViewController.h
//  NearStuffMap
//
//  Created by Marco Graciano on 5/29/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface RMYelpDetailViewController : UIViewController <UIWebViewDelegate> {
    UIWebView *customWebView;
}

@property (nonatomic, copy) NSString *yelpMobileURLString;


@end
