//
//  RMViewController.h
//  NearStuffMap
//
//  Created by Marco S. Graciano on 4/22/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "RMMasterSDK.h"
#import "RMFoursquareSDK.h"

@interface RMViewController : UIViewController <MKMapViewDelegate, FoursquareDelegate> {
    
    float latitude;
    float longitude;
    
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void)zoomToUserLocation:(MKUserLocation *)userLocation;

@end
