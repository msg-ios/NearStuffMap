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
#import "RMFacebookSDK.h"
#import <CoreLocation/CoreLocation.h>

@interface RMViewController : UIViewController <MKMapViewDelegate, FoursquareDelegate, InstagramDelegate, YelpDelegate, TwitterSDKDelegate, FacebookDelegate> {
    
    float latitude;
    float longitude;
    
    BOOL canRefreshData;
    
    IBOutlet UIBarButtonItem *socialNetworks;
    
    MKUserLocation *lastUserLocation;
    
    NSMutableArray *annotationsArrayBackup;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *annotationsArray;

- (void)zoomToUserLocation:(MKUserLocation *)userLocation;

-(void)scheduledTask;

-(IBAction)createAndShowSocialNetworksView;
-(IBAction)refreshData;

@end
