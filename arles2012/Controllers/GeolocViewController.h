//
//  GeolocViewController.h
//  arles2012
//
//  Created by Eleve on 10/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@class GeolocViewController;

@protocol GeolocViewControllerDelegate
- (void)geolocViewControllerDidFinish:(GeolocViewController *)controller;
@end

@interface GeolocViewController : UIViewController <CLLocationManagerDelegate> {
    NSMutableArray *Lieux;
    IBOutlet MKMapView *map;
    NSMutableArray *mapAnnotations;
    CLLocationManager *position;
    BOOL *centerOnPlace;
}

@property (assign, nonatomic) IBOutlet id <GeolocViewControllerDelegate> delegate;

- (id)initWithJson;
- (id)initWithPlaces:(NSArray *)places;

- (void)done:(id)sender;
- (void)currentPosition:(id)sender;
- (void)showDetails:(id)sender;

- (void)gotoLocation;
- (void)manageAnnotations;
- (void)centerOnCurrentPosition:(CLLocation *)c;

@end
