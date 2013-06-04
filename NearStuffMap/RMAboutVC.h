//
//  RMAboutVC.h
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 30/05/13.
//  Copyright (c) 2013 Marco Graciano & Ramiro Guerrero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMAboutVC : UIViewController

-(IBAction)dismissView;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *fsLabel;
@property (strong, nonatomic) IBOutlet UIImageView *fsImage;
@property (strong, nonatomic) IBOutlet UILabel *yelpLabel;
@property (strong, nonatomic) IBOutlet UIImageView *yelpImage;

@end
