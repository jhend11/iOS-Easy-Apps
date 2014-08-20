//
//  MCSFourSquareRequest.h
//  My Cool Spots
//
//  Created by JOSH HENDERSHOT on 8/18/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MCSFourSquareRequest : NSObject 

// create method that passes a lat, long and returns an array of venues

+ (NSArray *)getVenuesWithLocation:(CLLocation *)location;


@end
