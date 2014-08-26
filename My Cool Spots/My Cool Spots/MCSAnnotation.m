//
//  MCSAnnotation.m
//  My Cool Spots
//
//  Created by JOSH HENDERSHOT on 8/18/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "MCSAnnotation.h"

@implementation MCSAnnotation
-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;
{
    _coordinate = newCoordinate;
}
-(void)setTitle:(NSString *)title
{
    _title = title;
}
@end
