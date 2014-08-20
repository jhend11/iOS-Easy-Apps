//
//  MSARequest.h
//  Mayorships
//
//  Created by JOSH HENDERSHOT on 8/19/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MSARequest : NSObject
+(void)findMayorshipsWithLocation:(CLLocation *)location;
+(NSArray*)findVenuesWithLocation:(CLLocation*)location;
@end
