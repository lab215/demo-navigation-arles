//
//  BilletViewController.m
//  arles2012
//
//  Created by Eleve on 24/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "BilletViewController.h"

@implementation BilletViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.menuTitle = @"Billet";
        self.menuSubTitle = @"Renseignements et réservations";
        self.menuLogo = [UIImage imageNamed:@"MENU_BILLET_OFF.png"];
        self.menuLogoOn = [UIImage imageNamed:@"MENU_BILLET_ON.png"];
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
    NSString *urlAddress = @"http://www.fnacspectacles.com";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObject];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
