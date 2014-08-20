//
//  MSAData.m
//  Mayorships
//
//  Created by JOSH HENDERSHOT on 8/19/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "MSAData.h"
@interface MSAData()



@end


@implementation MSAData

-(id)init
{
  self =  [super init];
    if (self)
    {
        self.venuesWithMayors = [[NSMutableArray alloc]init];
        self.venuesWithoutMayors = [[NSMutableArray alloc]init];
    }
    
    
    return self;
}

+ (MSAData *)mainData
{
    static dispatch_once_t create;
    static MSAData * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[MSAData alloc] init];
    });
    return singleton;
}


@end
