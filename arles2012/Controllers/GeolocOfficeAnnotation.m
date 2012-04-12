//
//  GeolocOfficeAnnotation.m
//  arles2012
//
//  Created by Eleve on 10/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "GeolocOfficeAnnotation.h"

@implementation GeolocOfficeAnnotation

@synthesize coordinate, title, subtitle;

- (id)initWithCoords:(CLLocationCoordinate2D)newCoordinate title:(NSString *)newTitle subtitle:(NSString *)newSubtitle
{
    coordinate = newCoordinate;
    title = newTitle;
    subtitle = newSubtitle;
    return self;
}

@end
