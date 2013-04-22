//
//  RMMapViewController.h
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 22/04/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface RMMapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>{
    CLLocationManager *locationManager;
    float latitude;
    float longitude;
    MKMapView *rmMapView;
    
}

-(void)startLocationManager;

@end
