//
//  RootViewController.m
//  ViewDeckExample
//
//  Created by Eleve on 05/01/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "IIViewDeckController.h"
#import "RootViewController.h"
#import "GeolocViewController.h"

@implementation RootViewController

@synthesize menuTitle = _menuTitle;
@synthesize menuSubTitle = _menuSubTitle;
@synthesize menuLogo = _menuLogo;
@synthesize menuLogoOn = _menuLogoOn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextAlignment:UITextAlignmentCenter];
        [label setFont:[UIFont fontWithName:@"arlesienne2011" size:24]];           
        [label setTextColor:[UIColor whiteColor]];
        [label setShadowColor:[UIColor colorWithWhite:0.0 alpha:0.5]];
        [self.navigationItem setTitleView:label];
        
         [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"detail_background.png"]]];
    
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    
    // Left button
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"menu-open.png"] forState:UIControlStateNormal];
    [leftButton.imageView setFrame:CGRectMake(15, 0, 25, 25)];
    [leftButton setFrame:CGRectMake(0, 0, 40, 25)];
    [leftButton addTarget:self.viewDeckController action:@selector(toggleLeftView) forControlEvents:UIControlEventTouchUpInside];
    
    // Right button
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"menu-geoloc.png"] forState:UIControlStateNormal];
    [rightButton setFrame:CGRectMake(0, 0, 40, 25)];
    [rightButton addTarget:self action:@selector(gotoGeoloc:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    if (self.menuTitle) {
        UILabel *test = (UILabel *) self.navigationItem.titleView;
        [test setText:[self.menuTitle uppercaseString]];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}

- (id)description
{
    return self.menuTitle;
}

#pragma mark - geoloc

- (void)geolocViewControllerDidFinish:(GeolocViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)gotoGeoloc:(id)sender
{
    GeolocViewController *geolocViewController = [[GeolocViewController alloc] initWithJson];
    geolocViewController.delegate = self;    
    UINavigationController *navGeoloc = [[UINavigationController alloc] initWithRootViewController:geolocViewController];
    navGeoloc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;    
    [self presentModalViewController:navGeoloc animated:YES];  
}

@end
