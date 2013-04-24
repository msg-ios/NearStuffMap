//
//  RMTwitterSDK.m
//  NearStuffMap
//
//  Created by Ramiro Guerrero on 24/04/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import "RMTwitterSDK.h"
#import "AFJSONRequestOperation.h"

@implementation RMTwitterSDK

+ (RMTwitterSDK *)sharedClient {
    static RMTwitterSDK *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[RMTwitterSDK alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.twitter.com/1/"] key:@"" secret:@""];
        [_sharedClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [_sharedClient setDefaultHeader:@"Accept" value:@"application/json"];
        
    });
    
    return _sharedClient;
}


-(void)getPlacesOnTwitterWithLatitude:(NSString *)latitude AndLongitude:(NSString *)longitude AndWithDelegate:(NSObject<TwitterSDKDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    
    [mutableParameters setValue:latitude forKey:@"lat"];
    [mutableParameters setValue:longitude forKey:@"long"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    NSString *path = [NSString stringWithFormat:@"http://api.twitter.com/1/geo/search.json"];
    
    [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"BLOG INFO REQUEST");
        
        NSLog(@"Response object: %@", responseObject);
        
        [delegate loadNearbyTwitterPlacesWithData:responseObject];
        
        //Complete with delegate call
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        
    }];
    
}

@end
