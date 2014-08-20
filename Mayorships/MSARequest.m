//
//  MSARequest.m
//  Mayorships
//
//  Created by JOSH HENDERSHOT on 8/19/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "MSARequest.h"
#import "MSAData.h"
#define API @"https://api.foursquare.com/v2/"
#define CLIENT_ID @"C0XU1AR5ND045T5HYY0RWFE4113343ERVL2RSMWHPPCUAQXS"
#define CLIENT_SECRET @"RF52O0RF4RW31IJ3G0SY3MWROKXZWWIM3BLFRLTNRPZ0QLUK"

//  venues/search?ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD

@implementation MSARequest
+(void)findMayorshipsWithLocation:(CLLocation *)location
{
    NSArray * venues = [MSARequest findVenuesWithLocation:location];
    
    NSMutableArray * mayors = [@[] mutableCopy];
    NSMutableArray * noMayors = [@[] mutableCopy];

    
    for (NSDictionary * venue in venues)
    {
        NSString * endpoint = [NSString stringWithFormat:@"venues/%@",venue [@"id"]];
        NSDictionary * venueInfo = [MSARequest fourSquareRequestWithEndpoint:endpoint andParameters:@{}];
        NSDictionary * mayor = venueInfo[@"response"][@"venue"][@"mayor"];
        
        if (!mayor[@"user"])
        {
            [noMayors addObject:venueInfo];
            
        }
        else
        {
            [mayors addObject:venueInfo];

        }
    }
    
    [MSAData mainData].venuesWithoutMayors = [noMayors copy];
    [MSAData mainData].venuesWithMayors = [mayors copy];
    
    NSLog(@"%@", [MSAData mainData].venuesWithoutMayors);

}

+(NSArray *)findVenuesWithLocation:(CLLocation *)location
{
    NSDictionary * parameters = @{
                                  @"ll":[NSString stringWithFormat:@"%f,%f",location.coordinate.latitude, location.coordinate.longitude]
                                      };
    return [MSARequest fourSquareRequestWithEndpoint:@"venues/search" andParameters:parameters][@"response"][@"venues"];
}

+(NSDictionary*)fourSquareRequestWithEndpoint:(NSString*)endpoint andParameters: (NSDictionary*)parameters
{
    NSMutableString * requestString = [[API stringByAppendingString:endpoint]mutableCopy];
    
    // make v custom to current day
    
    NSDate * currentDate = [[NSDate alloc]init];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString * localDateString = [dateFormatter stringFromDate:currentDate];
    
    [requestString appendString:[NSString stringWithFormat: @"?client_id=%@&client_secret=%@&v=%@", CLIENT_ID, CLIENT_SECRET, localDateString]];
    
    for (NSString * key in [parameters allKeys])
    {
        
        [requestString appendFormat:@"&%@=%@",key, [parameters objectForKey:key]];
        
    }
    NSLog(@"%@",requestString);
//    NSString * endpointURL = [API stringByAppendingString:endpoint];
    
    NSURL * requestURL = [NSURL URLWithString:requestString];
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary * responseInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    NSLog(@"%@",responseInfo);
    return responseInfo;
}

@end
