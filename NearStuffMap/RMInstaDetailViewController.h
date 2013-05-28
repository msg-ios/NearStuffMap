//
//  RMInstaDetailViewController.h
//  NearStuffMap
//
//  Created by Marco Graciano on 5/27/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RMInstaDetailViewController : UIViewController
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) IBOutlet UILabel *filterLabel;

@end
