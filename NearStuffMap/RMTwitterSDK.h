//
//  RMTwitterSDK.h
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 24/04/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import "AFOAuth1Client.h"

@protocol TwitterSDKDelegate <NSObject>

-(void)loadNearbyTwitterPlacesWithData:(NSDictionary *)data;

@end
@interface RMTwitterSDK : AFOAuth1Client

+ (RMTwitterSDK *)sharedClient;

-(void)getPlacesOnTwitterWithLatitude:(NSString *)latitude AndLongitude:(NSString *)longitude AndWithDelegate:(NSObject<TwitterSDKDelegate> *)delegate;

@end
