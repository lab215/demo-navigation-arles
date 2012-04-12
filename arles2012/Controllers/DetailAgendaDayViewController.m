//
//  DetailAgendaDayViewController.m
//  arles2012
//
//  Created by Franco Bouly on 1/26/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "DetailAgendaDayViewController.h"

@implementation DetailAgendaDayViewController

@synthesize content = _content;
@synthesize date = _date;
@synthesize rootViewController = _rootViewController;
@synthesize dateOutlet = _dateOutlet;
@synthesize timeOutlet = _timeOutlet;
@synthesize titleOutlet = _titleOutlet;
@synthesize lieuOutlet = _lieuOutlet;
@synthesize artistesOutlet = _artistesOutlet;
@synthesize animateurOutlet = _animateurOutlet;
@synthesize descriptionOutlet = _descriptionOutlet;

- (id)initWithRootViewController:(UIViewController *)controller
{
    self = [super init];
    if (self) {
        self.rootViewController = controller;
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

    NSLog(@"%@",self.content.description);

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date_start = [formatter dateFromString:[self.content valueForKey:@"date_start"]];
    NSDate *date_end = [formatter dateFromString:[self.content valueForKey:@"date_end"]];
    
    [formatter setDateFormat:@"dd MMMM yyyy"];
    
    [self.dateOutlet setText:[formatter stringFromDate:date_start]];
    
    [formatter setDateFormat:@"HH"];
    
    self.timeOutlet = [NSString stringWithFormat:@"%@H-%@H",
                       [formatter stringFromDate:date_start],
                       [formatter stringFromDate:date_end]];
    
    
    [self.titleOutlet setText:[[self.content valueForKey:@"title"] uppercaseString]];
     [self.descriptionOutlet setText:[self.content valueForKey:@"description"]];
    [self.animateurOutlet setText:[self.content valueForKey:@"animateur"]];
    [self.artistesOutlet setText:[self.content valueForKey:@"intervenants"]];
}

- (void)viewWillAppear:(BOOL)animated
{
    // Left button
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"menu-open.png"] forState:UIControlStateNormal];
    [leftButton.imageView setFrame:CGRectMake(15, 0, 25, 25)];
    [leftButton setFrame:CGRectMake(0, 0, 40, 25)];
    [leftButton addTarget:self.rootViewController action:@selector(dismissModal:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    [self.navigationController.navigationBar addSubview:leftButton];
}

- (void)viewDidUnload
{
    [self setDateOutlet:nil];
    [self setTimeOutlet:nil];
    [self setTitleOutlet:nil];
    [self setLieuOutlet:nil];
    [self setArtistesOutlet:nil];
    [self setAnimateurOutlet:nil];
    [self setDescriptionOutlet:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)dismissModal:(id)sender {
    [self.rootViewController dismissModalViewControllerAnimated:YES];
}
@end
