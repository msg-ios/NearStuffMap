//
//  RMMapViewController.m
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 22/04/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import "RMMapViewController.h"

@interface RMMapViewController ()

@end

@implementation RMMapViewController

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
    
    [self startMap];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startMap{
    if (!rmMapView)
        rmMapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    
    rmMapView.delegate = self;
    
    rmMapView.showsUserLocation = YES;
    
    [self startLocationManager];
    
    [self.view addSubview:rmMapView];
}
-(void)startLocationManager{
    
    
    if (!locationManager){
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        
        //  [locationManager setDistanceFilter:kCLDistanceFilterNone];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    }
    
    [locationManager startUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    NSLog(@"time: %f", t);
    if (t < - 180)
    {
        return;
    }
    
    if (newLocation.coordinate.latitude)
        latitude = newLocation.coordinate.latitude;
    
    if (newLocation.coordinate.longitude)
        longitude = newLocation.coordinate.longitude;
    
    
    NSLog(@"Latitude: %f  Longitude: %f", latitude, longitude);
    
    [locationManager stopUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
	NSLog(@"%@", error);
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 400, 400);
    
    [rmMapView setRegion:region animated:YES];
}

@end
