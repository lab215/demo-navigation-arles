//
//  GeolocAnnotation.h
//  arles2012
//
//  Created by Eleve on 10/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface GeolocAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) NSString *placeId;

- (id)initWithCoords:(CLLocationCoordinate2D)newCoordinate title:(NSString *)newTitle subtitle:(NSString *)newSubtitle placeId:(NSString *)newPlaceId;

@end
