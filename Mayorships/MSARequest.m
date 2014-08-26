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
//+(void)findMayorshipsWithLocation:(CLLocation *)location
+(void)findMayorshipsWithLocation:(CLLocation *)location completion:(void (^)(NSArray * mayors))completion
{
   [MSARequest findVenuesWithLocation:location completion:^(NSArray *venues)
    {
       NSMutableArray * mayors = [@[] mutableCopy];
       NSMutableArray * noMayors = [@[] mutableCopy];
       
       
       for (NSDictionary * venue in venues)
       {
           NSString * endpoint = [NSString stringWithFormat:@"venues/%@",venue [@"id"]];
           //        NSDictionary * venueInfo = [MSARequest fourSquareRequestWithEndpoint:endpoint andParameters:@{}];
           [MSARequest fourSquareRequestWithEndpoint:endpoint andParameters:@{} completion:^(NSDictionary *responseInfo)
            {
               
               NSDictionary * mayor = responseInfo[@"response"][@"venue"][@"mayor"];
               
               if (!mayor[@"user"])
               {
                   [noMayors addObject:responseInfo];
                   
               }
               else
               {
                   [mayors addObject:mayor];

               }
            
                if (completion) completion(mayors);
                
                [MSAData mainData].venuesWithoutMayors = [noMayors copy];
                [MSAData mainData].venuesWithMayors = [mayors copy];
                
                
                NSLog(@"%@", [MSAData mainData].venuesWithoutMayors);

               //            [mayors addObject:mayor];
           }];
           
           
           
       }
        
    }];
    
   

}

+(void)findVenuesWithLocation:(CLLocation *)location completion:(void (^)(NSArray * venues))completion
{
    NSDictionary * parameters = @{
                                  @"ll":[NSString stringWithFormat:@"%f,%f",location.coordinate.latitude, location.coordinate.longitude]
                                      };
    [MSARequest fourSquareRequestWithEndpoint:@"venues/search" andParameters:parameters completion:^(NSDictionary *responseInfo)
    {
        if (completion) completion(responseInfo[@"response"][@"venues"]);
    }];
//    return [MSARequest fourSquareRequestWithEndpoint:@"venues/search" andParameters:parameters][@"response"][@"venues"];
}

+(void)fourSquareRequestWithEndpoint:(NSString*)endpoint andParameters: (NSDictionary*)parameters completion:(void(^)(NSDictionary * responseInfo))completion
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
//    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        NSDictionary * responseInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
       if (completion) completion(responseInfo);
        

    }];
//    NSLog(@"%@",responseInfo);
//    return responseInfo;
}

@end
