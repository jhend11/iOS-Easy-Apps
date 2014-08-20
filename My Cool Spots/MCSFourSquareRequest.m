//
//  MCSFourSquareRequest.m
//  My Cool Spots
//
//  Created by JOSH HENDERSHOT on 8/18/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "MCSFourSquareRequest.h"
#import "MCSViewController.h"
#import "AFNetworking.h"
#import <CoreLocation/CoreLocation.h>
#import "MapKit/MapKit.h"


// https://api.foursquare.com/v2/venues/explore?oauth_token=H3QOGVEDWXF0K5XXU2OLF1OB3I4VKIDNZLUU3XHCUZARGWQP&v=20140818&ll=33.848640,-84.373465&radius%20=%201000

@implementation MCSFourSquareRequest


+(NSArray *)getVenuesWithLocation:(CLLocation *)location
{
    AFHTTPRequestOperationManager * requestManager = [[AFHTTPRequestOperationManager alloc]init];
    [requestManager GET:@"https://api.foursquare.com/v2/venues/explore?oauth_token=H3QOGVEDWXF0K5XXU2OLF1OB3I4VKIDNZLUU3XHCUZARGWQP&v=20140818&ll=33.848640,-84.373465&radius%20=%201000" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
    
    
    
    }];
}

@end
