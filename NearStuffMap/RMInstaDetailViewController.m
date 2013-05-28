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
@synthesize photo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    UIImageView *instaPhotoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 300, 300)];
    instaPhotoImageView.image = photo;
   /*
    //Adds shadow to image view:
    CALayer *layer = instaPhotoImageView.layer;
    layer.shadowOffset = CGSizeZero;
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 4.0f;
    layer.shadowOpacity = 0.80f;
    
    CGSize size = instaPhotoImageView.bounds.size;
    CGFloat curlFactor = 15.0f;
    CGFloat shadowDepth = 5.0f;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0f, 0.0f)];
    [path addLineToPoint:CGPointMake(size.width, 0.0f)];
    [path addLineToPoint:CGPointMake(size.width, size.height + shadowDepth)];
    [path addCurveToPoint:CGPointMake(0.0f, size.height + shadowDepth)
            controlPoint1:CGPointMake(size.width - curlFactor, size.height + shadowDepth - curlFactor)
            controlPoint2:CGPointMake(curlFactor, size.height + shadowDepth - curlFactor)];
    [path closePath];
    layer.shadowPath = path.CGPath;*/
    
    instaPhotoImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    instaPhotoImageView.layer.shadowOpacity = 0.7f;
    instaPhotoImageView.layer.shadowOffset = CGSizeMake(6.0f, 6.0f);
    instaPhotoImageView.layer.shadowRadius = 5.0f;
    instaPhotoImageView.layer.masksToBounds = NO;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:instaPhotoImageView.bounds];
    instaPhotoImageView.layer.shadowPath = path.CGPath;
    
    [self.view addSubview:instaPhotoImageView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"purty_wood"]];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
