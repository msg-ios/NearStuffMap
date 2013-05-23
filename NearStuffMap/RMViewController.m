//
//  RMViewController.m
//  NearStuffMap
//
//  Created by Marco S. Graciano on 4/22/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import "RMViewController.h"
#import "RMMapViewAnnotation.h"
#import "RMMasterSDK.h"
#import "RMSettingsViewController.h"
#import "RMAppDelegate.h"

@interface CustomPin : MKPinAnnotationView
{
}
- (id)initWithAnnotation:(id <MKAnnotation>) annotation andPinColor:(MKPinAnnotationColor *)pinColor;
- (id)initWithAnnotation:(id <MKAnnotation>) annotation andImage:(UIImage *)photo;

@end

@implementation CustomPin

- (id)initWithAnnotation:(id <MKAnnotation>)annotation andImage:(UIImage *)photo
{
    
    self = [super initWithAnnotation:annotation reuseIdentifier:@"CustomId"];
    
    if (self)
    {
        
        self.image = photo;
        
        self.frame = CGRectMake(0, 0, 50, 50);
    }
    return self;
    
}

- (id)initWithAnnotation:(id <MKAnnotation>)annotation andPinColor:(MKPinAnnotationColor *)pinColor
{
    
    self = [super initWithAnnotation:annotation reuseIdentifier:@"CustomId"];
    
    if (self)
    {
        
        [self setPinColor:pinColor];
        
    }
    return self;
    
}

@end

@interface RMViewController ()

@end

@implementation RMViewController
@synthesize mapView = _mapView;
@synthesize annotationsArray = _annotationsArray;
@synthesize arrayBackup;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self.mapView setShowsUserLocation:YES];
    self.mapView.delegate = self;
    canRefreshData = YES;
    self.annotationsArray = [[NSMutableArray alloc] init];
    arrayBackup = [[NSMutableArray alloc] init];

    lastUserLocation = [[MKUserLocation alloc] init];
    [lastUserLocation setCoordinate:CLLocationCoordinate2DMake(0.0000, 0.0000)];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    

    if (self.mapView)
    {
        RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];
        
       
        [self.mapView removeAnnotations:self.mapView.annotations];
        

        self.annotationsArray = [[NSMutableArray alloc] initWithArray:arrayBackup];
        
        
        for (int loop = 0; loop < 10; loop++)
        {
        for (int k = 0; k < app.socialArrays.count ; k++)
        {
            
            for ( int i = 0; i < self.annotationsArray.count; i++)
        {
         //   RMMapViewAnnotation *annotation = (RMMapViewAnnotation *)[self.annotationsArray objectAtIndex:i];

            NSLog(@"%i", i);
            NSLog(@"Social: %@", [[self.annotationsArray objectAtIndex:i] socialNetwork]);
            NSLog(@"SocialDelete: %@", [app.socialArrays objectAtIndex:k]);

            if ([[[self.annotationsArray objectAtIndex:i] socialNetwork] isEqualToString:[app.socialArrays objectAtIndex:k]])
            {
                NSLog(@"DELETED!");
                [self.annotationsArray removeObjectAtIndex:i];
            }
            
        }
        }
        }
      
        [self refreshData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMapView:nil];
    [super viewDidUnload];
}



- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.mapView.centerCoordinate = userLocation.coordinate;
    
    latitude = userLocation.coordinate.latitude;
    longitude = userLocation.coordinate.longitude;
    
    if (fabsf(userLocation.coordinate.latitude - lastUserLocation.coordinate.latitude) > 0.0010 || fabsf(userLocation.coordinate.longitude - lastUserLocation.coordinate.longitude) > 0.0010)
    {
                
        [lastUserLocation setCoordinate:userLocation.coordinate];
        
        [self loadAnnotations];
    
    }
    [self zoomToUserLocation:self.mapView.userLocation];
}

- (void)zoomToUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (userLocation.location.coordinate, 50, 50);
    [self.mapView setRegion:region animated:NO];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(RMMapViewAnnotation *)annotation{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];

    if([annotation isKindOfClass:[RMMapViewAnnotation class]]) {
        MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomId"];
        if(nil == view) {
            
            
            if ( app.foursquareSwitch && [annotation.socialNetwork isEqualToString:@"Foursquare"])
            {                
                view = [[CustomPin alloc] initWithAnnotation:annotation andImage:[UIImage imageNamed:@"fourPin"]];
            }
            else if (app.instagramSwitch && [annotation.socialNetwork isEqualToString:@"Instagram"])
            {
                view = [[CustomPin alloc] initWithAnnotation:annotation andImage:annotation.photo];
            }
            else if (app.yelpSwitch && [annotation.socialNetwork isEqualToString:@"Yelp"])
            {
                view = [[CustomPin alloc] initWithAnnotation:annotation andImage:[UIImage imageNamed:@"yelpPin"]];
            }
            else if (app.twitterSwitch && [annotation.socialNetwork isEqualToString:@"Twitter"])
            {
                view = [[CustomPin alloc] initWithAnnotation:annotation andImage:[UIImage imageNamed:@"twitterPin"]];
            }
            else if (app.facebookSwitch && [annotation.socialNetwork isEqualToString:@"Facebook"])
            {
                view = [[CustomPin alloc] initWithAnnotation:annotation andImage:[UIImage imageNamed:@"facePin"]];
            }

           
            
        }
        else {
            view.annotation = annotation;
            
            if ( app.foursquareSwitch && [annotation.socialNetwork isEqualToString:@"Foursquare"])
            {
                view = [[CustomPin alloc] initWithAnnotation:annotation andImage:[UIImage imageNamed:@"fourPin"]];
            }
            else if (app.instagramSwitch && [annotation.socialNetwork isEqualToString:@"Instagram"])
            {
                view = [[CustomPin alloc] initWithAnnotation:annotation andImage:annotation.photo];
            }
            else if (app.yelpSwitch && [annotation.socialNetwork isEqualToString:@"Yelp"])
            {
                view = [[CustomPin alloc] initWithAnnotation:annotation andImage:[UIImage imageNamed:@"yelpPin"]];
            }
            else if (app.twitterSwitch && [annotation.socialNetwork isEqualToString:@"Twitter"])
            {
                view = [[CustomPin alloc] initWithAnnotation:annotation andImage:[UIImage imageNamed:@"twitterPin"]];
            }
            else if (app.facebookSwitch && [annotation.socialNetwork isEqualToString:@"Facebook"])
            {
                view = [[CustomPin alloc] initWithAnnotation:annotation andImage:[UIImage imageNamed:@"facePin"]];
            }
        }
        
        [view setCanShowCallout:YES];

        
        return view;
    }
    
    return nil;
}

-(void)loadAnnotations{
    
    RMAppDelegate *app = (RMAppDelegate *)[[UIApplication sharedApplication] delegate];

    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%f", latitude],@"latitude", [NSString stringWithFormat:@"%f", longitude], @"longitude", nil];


    if (app.foursquareSwitch)
    {
        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"700", @"radius", @"15", @"limit", nil];
        [[RMMasterSDK FoursquareSDK] getUserlessExploreVenuesWithLatitudeLongitude:dict OrNear:nil AndParameters:params AndWithDelegate:self];
    
    }
    
    if (app.instagramSwitch){
        
        NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%f", latitude],@"lat", [NSString stringWithFormat:@"%f", longitude], @"lng", @"1000", @"distance", nil];

        [[RMMasterSDK InstagramSDK] getWAMediaSearchWithParams:dict2 AndWithDelegate:self];
        
    }
    
    if (app.yelpSwitch){
        [[RMMasterSDK YelpSDK] getSearchWithTerm:nil AndCoordinates:dict AndParams:[NSDictionary dictionaryWithObjectsAndKeys:@"1000",@"radius_filter", nil] AndWithDelegate:self];
        
    }
    
    if (app.twitterSwitch){
        [[RMTwitterSDK sharedClient] getPlacesOnTwitterWithLatitude:[NSString stringWithFormat:@"%f", latitude] AndLongitude:[NSString stringWithFormat:@"%f", longitude] AndWithDelegate:self];
        
    }
    
    if (app.facebookSwitch)
    {
        NSString *lat = [NSString stringWithFormat:@"%f", latitude];
        NSString *lon = [NSString stringWithFormat:@"%f", longitude];
        NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"1000", @"distance", nil];
        [[RMFacebookSDK sharedClient] getPublicPlaceWithQuery:@"coffee" WithLatitude:lat WithLongitude:lon WithParams:dict3 AndWithDelegate:self];
    }
}

-(void)loadNearbyExploreWithData:(NSDictionary *)array{
    

    for (int i = 0; i < [[[[[array  objectForKey:@"response"] objectForKey:@"groups"] objectAtIndex:0] objectForKey:@"items"] count] ; i++)
    {
        RMMapViewAnnotation *annotation = [[RMMapViewAnnotation alloc] init];
        
        CLLocationCoordinate2D location;
       
        location.latitude = [[[[[[[[[array  objectForKey:@"response"] objectForKey:@"groups"] objectAtIndex:0] objectForKey:@"items"] objectAtIndex:i] objectForKey:@"venue"] objectForKey:@"location"] objectForKey:@"lat"] floatValue];
       location.longitude = [[[[[[[[[array  objectForKey:@"response"] objectForKey:@"groups"] objectAtIndex:0] objectForKey:@"items"] objectAtIndex:i] objectForKey:@"venue"] objectForKey:@"location"] objectForKey:@"lng"] floatValue];
        
        
        
        NSLog(@"LAT : %f LON: %f", location.latitude, location.longitude);
            
        annotation.coordinate = location;
        annotation.title = [[[[[[[array  objectForKey:@"response"] objectForKey:@"groups"] objectAtIndex:0] objectForKey:@"items"] objectAtIndex:i] objectForKey:@"venue"] objectForKey:@"name"];
        annotation.subtitle = @"Foursquare";
        annotation.socialNetwork = @"Foursquare";
        
        [self.mapView addAnnotation:annotation];
        [self.annotationsArray addObject:annotation];
        [arrayBackup addObject:annotation];
    }
    
}

-(void)loadNerbyImagesWithData:(NSDictionary *)data{
    

    
    for (int i = 0; i < [[data objectForKey:@"data"] count]; i++){
        
        RMMapViewAnnotation *annotation = [[RMMapViewAnnotation alloc] init];
        
        CLLocationCoordinate2D location;
        
        location.latitude = [[[[[data objectForKey:@"data"] objectAtIndex:i] objectForKey:@"location"] objectForKey:@"latitude"] floatValue];
        location.longitude = [[[[[data objectForKey:@"data"] objectAtIndex:i] objectForKey:@"location"] objectForKey:@"longitude"] floatValue];
        
        
        
        NSLog(@"LAT : %f LON: %f", location.latitude, location.longitude);
        
        annotation.coordinate = location;
        
       // UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[[[[data objectForKey:@"data"] objectAtIndex:i] objectForKey:@"images"] objectForKey:@"thumbnail"] objectForKey:@"url"]]]];
        
          NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[[[[[data objectForKey:@"data"] objectAtIndex:i] objectForKey:@"images"] objectForKey:@"thumbnail"] objectForKey:@"url"]]];
        
        AFImageRequestOperation *operation;
        operation = [AFImageRequestOperation imageRequestOperationWithRequest:request
                                                         imageProcessingBlock:nil
                                                                      success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                                                          
                                                                        annotation.photo = image;

                                                                      }
                                                                      failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                                                          NSLog(@"%@", [error localizedDescription]);
                                                                      }];
        [operation start];

       
        
        annotation.socialNetwork = @"Instagram";
        
        [self.mapView addAnnotation:annotation];
        [self.annotationsArray addObject:annotation];
        [arrayBackup addObject:annotation];

    }
}


-(void)loadNearbyPlacesYelpWithData:(NSDictionary *)data{
    

    for (int i = 0; i < [[data objectForKey:@"businesses"] count] ; i++)
    {
        RMMapViewAnnotation *annotation = [[RMMapViewAnnotation alloc] init];
        
        CLLocationCoordinate2D location;
        
        location.latitude = [[[[[[data objectForKey:@"businesses"] objectAtIndex:i] objectForKey:@"location"] objectForKey:@"coordinate"] objectForKey:@"latitude"] floatValue];
        location.longitude = [[[[[[data objectForKey:@"businesses"] objectAtIndex:i] objectForKey:@"location"] objectForKey:@"coordinate"] objectForKey:@"longitude"] floatValue];
        
        
        
        NSLog(@"LAT : %f LON: %f", location.latitude, location.longitude);
        
        annotation.coordinate = location;
        annotation.title = [[[data objectForKey:@"businesses"] objectAtIndex:i] objectForKey:@"name"];
        annotation.subtitle = @"Yelp";
        annotation.socialNetwork = @"Yelp";
        
        [self.mapView addAnnotation:annotation];
        [self.annotationsArray addObject:annotation];
        [arrayBackup addObject:annotation];

    }


}

-(void)loadNearbyTwitterPlacesWithData:(NSDictionary *)data{
    

    for (int i = 0 ; i < [[[data objectForKey:@"result"] objectForKey:@"places"] count]; i++)
    {
 
        for (int k = 0; k < [[[[[[data objectForKey:@"result"] objectForKey:@"places"] objectAtIndex:i] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] count] ; k++)
        {
            
           
            
            for (int q = 0; q < [[[[[[[data objectForKey:@"result"] objectForKey:@"places"] objectAtIndex:i] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] objectAtIndex:k] count]; q++)
            {
                
                RMMapViewAnnotation *annotation = [[RMMapViewAnnotation alloc] init];
                
                CLLocationCoordinate2D location;
                
                location.latitude = [[[[[[[[[data objectForKey:@"result"] objectForKey:@"places"] objectAtIndex:i] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] objectAtIndex:k] objectAtIndex:q] objectAtIndex:1] floatValue];
                location.longitude = [[[[[[[[[data objectForKey:@"result"] objectForKey:@"places"] objectAtIndex:i] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] objectAtIndex:k] objectAtIndex:q] objectAtIndex:0] floatValue];
                
                
                NSLog(@"LAT : %f LON: %f", location.latitude, location.longitude);
                
                annotation.coordinate = location;
                annotation.title = [[[[data objectForKey:@"result"] objectForKey:@"places"] objectAtIndex:i] objectForKey:@"full_name"];
                annotation.subtitle = @"Twitter";
                annotation.socialNetwork = @"Twitter";
                
                [self.mapView addAnnotation:annotation];
                [self.annotationsArray addObject:annotation];
                [arrayBackup addObject:annotation];

            }
            
        }
        
    }
}


-(void)loadNearbyFacebookPlacesWithData:(NSDictionary *)data {
    

    for (int i = 0; i < [[data objectForKey:@"data"] count]; i++){
        
        RMMapViewAnnotation *annotation = [[RMMapViewAnnotation alloc] init];
        
        CLLocationCoordinate2D location;
        
        location.latitude = [[[[[data objectForKey:@"data"] objectAtIndex:i] objectForKey:@"location"] objectForKey:@"latitude"] floatValue];
        location.longitude = [[[[[data objectForKey:@"data"] objectAtIndex:i] objectForKey:@"location"] objectForKey:@"longitude"] floatValue];
        
        NSLog(@"LAT : %f LON: %f", location.latitude, location.longitude);
        
        annotation.coordinate = location;
        annotation.title = [[[data objectForKey:@"data"] objectAtIndex:i] objectForKey:@"name"];
        annotation.subtitle = @"Facebook";
        annotation.socialNetwork = @"Facebook";
        
        [self.mapView addAnnotation:annotation];
        [self.annotationsArray addObject:annotation];
        [arrayBackup addObject:annotation];

    }
    
}


-(IBAction)createAndShowSocialNetworksView{
    
    RMSettingsViewController *settingsVC = [[RMSettingsViewController alloc] initWithNibName:@"RMSettingsViewController" bundle:nil];
    
    [self presentViewController:settingsVC animated:YES completion:nil];
    
}

-(IBAction)refreshData{

    if (self.mapView)
    {

        
        NSLog(@"Annotation count: %i", arrayBackup.count);
        NSLog(@"Annotation2 count: %i", self.annotationsArray.count);

       // if (canRefreshData) {
            
      //      canRefreshData = NO;
            
            //Remove all added annotations
            for (RMMapViewAnnotation *annotation in self.mapView.annotations)
            {
                [self.mapView removeAnnotation:annotation];
            }
        
            [self.mapView addAnnotations:self.annotationsArray];
        
           // [self loadAnnotations];
            //The user will be able to refresh the data in 15 min.
            //[self performSelector:@selector(scheduledTask) withObject:nil afterDelay:900.0];
       // }
      //  else {
      /*      UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Can't update data."
                                  message:@"Wait for timer to expire."
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
            [alert show];
        
        }*/
        
    
    }
}

-(void)scheduledTask {
    canRefreshData = YES;
}

@end
