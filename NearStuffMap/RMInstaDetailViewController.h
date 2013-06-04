//
//  RMInstaDetailViewController.h
//  NearStuffMap
//
//  Created by Marco Graciano on 5/27/13.
//  Copyright (c) 2013 Marco Graciano & Ramiro Guerrero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RMInstaDetailViewController : UIViewController
@property (strong, nonatomic) UIImage *photo;
@property (nonatomic, copy) NSString *filterString;
@property (nonatomic, copy) NSString *mediaIdString;
@property (nonatomic, copy) NSString *fullNameString;

-(void)openInInstaAppAction;

@end
