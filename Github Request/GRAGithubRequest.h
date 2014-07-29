//
//  GRAGithubRequest.h
//  Github Request
//
//  Created by JOSH HENDERSHOT on 7/28/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRAGithubRequest : NSObject
+(NSDictionary*)requestUserInfo:(NSString*)userName;

+(void)saveUsers:(NSArray*)users;
+(NSArray *)loadUsers;


@end
