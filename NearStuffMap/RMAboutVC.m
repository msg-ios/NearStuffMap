//
//  RMAboutVC.m
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 30/05/13.
//  Copyright (c) 2013 Marco Graciano & Ramiro Guerrero. All rights reserved.
//

#import "RMAboutVC.h"

@interface RMAboutVC ()

@end

@implementation RMAboutVC

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
    
    self.fsLabel.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y +self.textView.frame.size.height, 280, 21);
    self.fsImage.frame = CGRectMake(48, self.fsLabel.frame.origin.y + 21, 225, 54);
    self.yelpLabel.frame = CGRectMake(self.textView.frame.origin.x, self.fsImage.frame.origin.y + 60, 280, 21);
    self.yelpImage.frame = CGRectMake(98, self.yelpLabel.frame.origin.y + 21, 125, 30);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dismissView{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
