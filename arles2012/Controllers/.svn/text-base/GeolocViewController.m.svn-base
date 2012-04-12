//
//  GeolocViewController.m
//  arles2012
//
//  Created by Eleve on 10/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "GeolocViewController.h"
#import "GeolocAnnotation.h"
#import "GeolocInfoAnnotation.h"
#import "GeolocParkingAnnotation.h"
#import "GeolocOfficeAnnotation.h"
#import "DetailLieuxViewController.h"

@implementation GeolocViewController

@synthesize delegate;

- (id)initWithJson
{
    if (self) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];        
        Lieux = [[userDefaults objectForKey:@"json"] objectForKey:@"geoloc"];   
        centerOnPlace = NO;
    }
    return self;
}

- (id)initWithPlaces:(NSArray *)places
{
    if (self) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];        
        NSArray *listLieux = [[userDefaults objectForKey:@"json"] objectForKey:@"geoloc"]; 
        Lieux = [[NSMutableArray alloc] initWithCapacity:[places count]];
        for(int i = 0; i < [listLieux count]; i++)
        {
            if ([places containsObject:[[listLieux objectAtIndex:i] valueForKey:@"id"]]) {
                [Lieux addObject:[listLieux objectAtIndex:i]];
            }
        }
        centerOnPlace = YES;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    position = [[CLLocationManager alloc] init];
    position.delegate = self;
    [self gotoLocation];
}

- (void)viewWillAppear:(BOOL)animated {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:UITextAlignmentCenter];
    [label setFont:[UIFont fontWithName:@"arlesienne2011" size:24]];
    [label setTextColor:[UIColor whiteColor]];
    [label setShadowColor:[UIColor colorWithWhite:0.0 alpha:0.5]];
    NSString *text = @"Géolocalisation";    
    label.text = [text uppercaseString];;
    
    [self.navigationItem setTitleView:label];    
    
    // Left button
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"navigation-back.png"] forState:UIControlStateNormal];
    [leftButton.imageView setFrame:CGRectMake(15, 0, 25, 25)];
    [leftButton setFrame:CGRectMake(0, 0, 40, 25)];
    [leftButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    // Right button
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"navigation-position.png"] forState:UIControlStateNormal];
    [rightButton setFrame:CGRectMake(0, 0, 40, 25)];
    [rightButton addTarget:self action:@selector(currentPosition:) forControlEvents:UIControlEventTouchUpInside]; 
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];    
}

- (void)viewDidUnload
{
    map = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - geoloc

- (void)gotoLocation
{
    CLLocationCoordinate2D Arles;
    Arles.latitude = 43.673428;
    Arles.longitude = 4.63254;
    MKCoordinateRegion newRegion = [map regionThatFits:MKCoordinateRegionMakeWithDistance(Arles, 2000, 2000)];
    [map setRegion:newRegion animated:YES];
        
    [self manageAnnotations];
}

- (void)manageAnnotations
{
    mapAnnotations = [[NSMutableArray alloc] initWithCapacity:[Lieux count]];
    for(int i = 0; i < [Lieux count]; i++) {
        NSString *address = [[Lieux objectAtIndex:i]valueForKey:@"address"];
        CLGeocoder* gc = [[CLGeocoder alloc] init];
        [gc geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
            if ([placemarks count]>0) {

                CLPlacemark* mark = (CLPlacemark*)
                [placemarks objectAtIndex:0];
                double lat = mark.location.coordinate.latitude;
                double lng = mark.location.coordinate.longitude;

                CLLocationCoordinate2D coords;
                coords.latitude = lat;
                coords.longitude = lng;  
                
                if(centerOnPlace){
                    MKCoordinateRegion newRegion = [map regionThatFits:MKCoordinateRegionMakeWithDistance(coords, 2000, 2000)];
                    [map setRegion:newRegion animated:YES]; 
                    centerOnPlace = NO;
                }
                
                NSString *type = [[Lieux objectAtIndex:i]valueForKey:@"type"];
                if([type isEqualToString:@"info"]) 
                {
                    GeolocInfoAnnotation *place = [[GeolocInfoAnnotation alloc] initWithCoords:coords title:[[Lieux objectAtIndex:i]valueForKey:@"title"] subtitle:[[Lieux objectAtIndex:i]valueForKey:@"address"]];
                    [mapAnnotations addObject:place];                    
                }
                else if([type isEqualToString:@"office"])
                {
                    GeolocOfficeAnnotation *place = [[GeolocOfficeAnnotation alloc] initWithCoords:coords title:[[Lieux objectAtIndex:i]valueForKey:@"title"] subtitle:[[Lieux objectAtIndex:i]valueForKey:@"address"]];
                    [mapAnnotations addObject:place];                      
                }
                else if([type isEqualToString:@"parking"])
                {
                    GeolocParkingAnnotation *place = [[GeolocParkingAnnotation alloc] initWithCoords:coords title:[[Lieux objectAtIndex:i]valueForKey:@"title"] subtitle:[[Lieux objectAtIndex:i]valueForKey:@"address"]];
                    [mapAnnotations addObject:place];                      
                }                
                else
                {
                    NSString *newPlaceId = [[Lieux objectAtIndex:i]valueForKey:@"id"];
                    GeolocAnnotation *place = [[GeolocAnnotation alloc] initWithCoords:coords title:[[Lieux objectAtIndex:i]valueForKey:@"title"] subtitle:[[Lieux objectAtIndex:i]valueForKey:@"address"] placeId:newPlaceId];
                    [mapAnnotations addObject:place];
                    NSLog(@"placeId: %@", place.placeId);
                }                

                if([mapAnnotations count] == [Lieux count]) [map addAnnotations:mapAnnotations];
            }
        }];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    if ([annotation isKindOfClass:[GeolocAnnotation class]]) {
        static NSString* exposAnnotationIdentifier = @"ExposAnnotationIdentifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
        [map dequeueReusableAnnotationViewWithIdentifier:exposAnnotationIdentifier];
        if (!pinView)
        {
            MKAnnotationView* customPinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:exposAnnotationIdentifier];            

            customPinView.image = [UIImage imageNamed:@"PICTO_EXPO.png"];        
            customPinView.canShowCallout = YES;
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton setImage:[UIImage imageNamed:@"TABLEVIEW_ACCESSORY.png"] forState:UIControlStateNormal];            
            [rightButton setImage:[UIImage imageNamed:@"TABLEVIEW_ACCESSORY.png"] forState:UIControlStateHighlighted];            
            [rightButton addTarget:self
                            action:@selector(showDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            rightButton.tag = [[(GeolocAnnotation *)annotation placeId] intValue];
            
            customPinView.rightCalloutAccessoryView = rightButton;  
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    else if ([annotation isKindOfClass:[GeolocInfoAnnotation class]])
    {
        static NSString* infoAnnotationIdentifier = @"infoAnnotationIdentifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
        [map dequeueReusableAnnotationViewWithIdentifier:infoAnnotationIdentifier];
        if (!pinView)
        {
            MKAnnotationView* customPinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:infoAnnotationIdentifier];            
            
            customPinView.image = [UIImage imageNamed:@"PICTO_INFO.png"];        
            customPinView.canShowCallout = YES;                    
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;        
    }
    else if ([annotation isKindOfClass:[GeolocOfficeAnnotation class]])
    {
        static NSString* officeAnnotationIdentifier = @"officeAnnotationIdentifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
        [map dequeueReusableAnnotationViewWithIdentifier:officeAnnotationIdentifier];
        if (!pinView)
        {
            MKAnnotationView* customPinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:officeAnnotationIdentifier];            
            
            customPinView.image = [UIImage imageNamed:@"PICTO_OFFICE.png"];        
            customPinView.canShowCallout = YES;                    
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;        
    }
    else if ([annotation isKindOfClass:[GeolocParkingAnnotation class]])
    {
        static NSString* parkingAnnotationIdentifier = @"parkingAnnotationIdentifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
        [map dequeueReusableAnnotationViewWithIdentifier:parkingAnnotationIdentifier];
        if (!pinView)
        {
            MKAnnotationView* customPinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:parkingAnnotationIdentifier];            
            
            customPinView.image = [UIImage imageNamed:@"PICTO_PARKING.png"];        
            customPinView.canShowCallout = YES;                    
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;        
    }    
    return nil;
}

#pragma mark - buttons

- (void)done:(id)sender {
    [delegate geolocViewControllerDidFinish:self];
}

- (void)currentPosition:(id)sender {
    [position startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [self centerOnCurrentPosition:newLocation];
}

- (void)centerOnCurrentPosition:(CLLocation *)c
{
    [position stopUpdatingLocation];
    CLLocationCoordinate2D currentPosition;
    currentPosition.latitude = c.coordinate.latitude;
    currentPosition.longitude = c.coordinate.longitude;
    MKCoordinateRegion newRegion = [map regionThatFits:MKCoordinateRegionMakeWithDistance(currentPosition, 2000, 2000)];
    [map setRegion:newRegion animated:YES];    
}

- (void)showDetails:(id)sender
{
    NSInteger placeId = [sender tag];

    DetailLieuxViewController *detailLieuxViewController = [[DetailLieuxViewController alloc] init];
    

    [detailLieuxViewController setLieuxIdByIndex:placeId];
    [self.navigationController pushViewController:detailLieuxViewController animated:YES];
 
   
}

@end
