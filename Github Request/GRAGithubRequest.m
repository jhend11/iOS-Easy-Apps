//
//  GRAGithubRequest.m
//  Github Request
//
//  Created by JOSH HENDERSHOT on 7/28/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "GRAGithubRequest.h"

@implementation GRAGithubRequest

+(NSDictionary*)requestUserInfo:(NSString*)userName
{
    //take username and call the github url
    
    NSString * urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@?acess_token=3e4d1f26315b54680f936f644ae117fac87ae697", userName];
    NSURL * url = [NSURL URLWithString:urlString];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    NSURLResponse * response = nil;
    NSError * error = nil;
    
    /////////Mutable request
    
    NSMutableURLRequest * mutableRequest = [NSMutableURLRequest requestWithURL:url];
    [mutableRequest setHTTPMethod:@"POST"];
    
    // is the same as:
//    mutableRequest.HTTPMethod =@"POST";
    
    ////////mutable request
     
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary * userInfo = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&error];
    
    NSLog(@"Response data = %@", userInfo);
    return userInfo;
}

+(void)saveUsers:(NSArray*)users
{
    // path to what we are saving
    NSString * path = [GRAGithubRequest usersArchivePath];
    // then we archive
    NSData * userData = [NSKeyedArchiver archivedDataWithRootObject:users];
    //then we save file
    [userData writeToFile:path options:NSDataWritingAtomic error:nil];
}


+(NSArray *)loadUsers
{
    //path to what we are loading
    NSString * path = [GRAGithubRequest usersArchivePath];

    //then we unarchive
    NSArray * users = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    //then we return the array
    return users;
}

+(NSString*)usersArchivePath
{   //returns array of directories
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //grab first path from above array
    NSString * documentDirectory = [documentDirectories objectAtIndex:0];
    // return path/user.data
    return [documentDirectory stringByAppendingPathComponent:@"users.data"];
}

@end
