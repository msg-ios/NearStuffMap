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
#import "RMTwitterSDK.h"
@interface RMViewController : UIViewController <MKMapViewDelegate, FoursquareDelegate, InstagramDelegate, YelpDelegate, TwitterSDKDelegate> {
    
    float latitude;
    float longitude;
    
    IBOutlet UIBarButtonItem *socialNetworks;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

- (void)zoomToUserLocation:(MKUserLocation *)userLocation;

-(IBAction)createAndShowSocialNetworksView;
-(IBAction)refreshData;

@end
