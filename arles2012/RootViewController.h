//
//  RootViewController.h
//  ViewDeckExample
//
//  Created by Eleve on 05/01/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GeolocViewController.h"

@interface RootViewController : UIViewController <GeolocViewControllerDelegate>

@property (strong, nonatomic) NSString  *menuTitle;
@property (strong, nonatomic) NSString  *menuSubTitle;
@property (strong, nonatomic) UIImage   *menuLogo;
@property (strong, nonatomic) UIImage   *menuLogoOn;


- (void)gotoGeoloc:(id)sender;

@end
