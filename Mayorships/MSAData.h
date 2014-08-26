//
//  MSAData.h
//  Mayorships
//
//  Created by JOSH HENDERSHOT on 8/19/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSAData : NSObject
+ (MSAData *)mainData;
@property (nonatomic) NSArray * venuesWithMayors;
@property (nonatomic) NSArray * venuesWithoutMayors;

@end
