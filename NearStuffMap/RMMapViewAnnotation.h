//
//  RMMapViewAnnotation.h
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 22/04/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface RMMapViewAnnotation : NSObject <MKAnnotation>
{
    NSString *pType;
}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *socialNetwork;
@property (nonatomic, retain) MKPinAnnotationView *pin;
@property (nonatomic, retain) UIImage *photo;

@end
