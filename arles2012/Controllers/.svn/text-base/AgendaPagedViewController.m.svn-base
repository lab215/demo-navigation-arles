//
//  AgendaPagedViewController.m
//  arles2012
//
//  Created by Franco Bouly on 1/27/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "AgendaPagedViewController.h"
#import "DetailAgendaViewController.h"

@implementation AgendaPagedViewController
@synthesize pageControl = _pageControl;
@synthesize scrollView = _scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.menuTitle = @"Agenda";
        self.menuSubTitle = @"Les évenements";
        self.menuLogo = [UIImage imageNamed:@"MENU_AGENDA_OFF.png"];
        self.menuLogoOn = [UIImage imageNamed:@"MENU_AGENDA_ON.png"];    
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
    
    
    [self.scrollView setContentSize:CGSizeMake(960, self.scrollView.frame.size.width)];
    
    NSDateComponents *components1 = [[NSDateComponents alloc] init];
    NSDateComponents *components2 = [[NSDateComponents alloc] init];
    NSDateComponents *components3 = [[NSDateComponents alloc] init];
    
    [components1 setDay:1];
    [components2 setDay:1];
    [components3 setDay:1];
    [components1 setMonth:7];
    [components2 setMonth:8];
    [components3 setMonth:9];
    [components1 setYear:2012];
    [components2 setYear:2012];
    [components3 setYear:2012];
    
    AgendaViewController *page1 = [[AgendaViewController alloc] initWithDateComponents:components1];
    AgendaViewController *page2 = [[AgendaViewController alloc] initWithDateComponents:components2];
    AgendaViewController *page3 = [[AgendaViewController alloc] initWithDateComponents:components3];
    
    [page1 setRootController:self];
    [page2 setRootController:self];
    [page3 setRootController:self];
    
    [page1.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [page2.view setFrame:CGRectMake(320, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [page3.view setFrame:CGRectMake(640, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.scrollView addSubview:page1.view];
    [self.scrollView addSubview:page2.view];
    [self.scrollView addSubview:page3.view];    
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setPageControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.view bringSubviewToFront:self.pageControl];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scroll %f",scrollView.contentOffset.x);
    
    [self.pageControl setCurrentPage:scrollView.contentOffset.x/320];
}

- (void)didTapCellAtDate:(NSDate *)date
{
    NSLog(@"didtouch");
    DetailAgendaViewController *detailAgenda = [[DetailAgendaViewController alloc] init];
    [detailAgenda setDate:date];
    [self.navigationController pushViewController:detailAgenda animated:YES];
}


@end
