//
//  RMAboutVC.m
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 30/05/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
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

    // Do any additional setup after loading the view from its nib.
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
