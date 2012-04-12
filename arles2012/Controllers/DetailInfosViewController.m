//
//  DetailInfosViewController.m
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 27/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "DetailInfosViewController.h"

@implementation DetailInfosViewController
@synthesize contentWebView;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
     
        [contentWebView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"detail_background.png"]]];
    }
    return self;
}

- (void)backPreviousView{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)configureViewWithUrl:(NSString*)urlString{
    // Do any additional setup after loading the view from its nib.
    NSURL *url = [NSURL URLWithString:urlString];
    requestObject = [NSURLRequest requestWithURL:url];
    
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
    //Button back
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"navigation-back"] forState:UIControlStateNormal];
    [button setTitle:@"" forState:UIControlStateNormal];
    button.frame=CGRectMake(0.0, 0, 38.0, 28.0);
    [button addTarget:self action:@selector(backPreviousView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* deleteItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = deleteItem;
    
    [contentWebView loadRequest:requestObject];

}

- (void)viewDidUnload
{

    [self setContentWebView:nil];
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
