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
    
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *annotationsArray;
@property (nonatomic, retain) NSMutableArray *instagramArray;
@property (nonatomic, retain) NSMutableArray *yelpArray;
@property (nonatomic, retain) NSMutableArray *foursquareArray;
@property (nonatomic, retain) NSMutableArray *facebookArray;
@property (nonatomic, retain) NSMutableArray *twitterArray;

- (void)zoomToUserLocation:(MKUserLocation *)userLocation;

-(void)scheduledTask;
-(void)refreshDataUsingArray;

-(IBAction)createAndShowSocialNetworksView;
-(IBAction)refreshData;

@end
