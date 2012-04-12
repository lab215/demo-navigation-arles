//
//  TestDetailController.m
//  ViewDeckExample
//
//  Created by Franco Bouly on 1/6/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "TestDetailController.h"
#import "CenterInfosItem.h"

@implementation TestDetailController
@synthesize toolBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
  
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
    self.toolBar = [[ToolBar alloc] initWithRootViewController:self];  
    self.toolBar.delegate = self;
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark ToolBarDelegate implementation

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.toolBar.isPanelUp)
        [self.toolBar slideDownPanel];
}

- (bool)shouldBeMarkedAsFavorite {
    return YES;
}

- (void)addToFavoriteCalled{
    NSLog(@"addToFavoriteCalled");
}

- (NSString *)linkToShare {
    return @"http://rayfran.co";
}
- (NSString *)infosToDisplay {
    NSString *string = [[NSString alloc] initWithString:@"Blah blah blah blah"];
    return string;
}

- (NSArray *)centerInfosToDisplay {
    NSArray *infos = [NSArray arrayWithObjects:nil];
    return infos;
}

- (NSInteger)numberOfCenterInfosItems {
    return 6;
}

- (CenterInfosItem *)centerInfosItemForItemAtIndex:(NSInteger)index
{
    NSLog(@"centerInfos");
    
    CenterInfosItem *item = [[CenterInfosItem alloc] init];
    
    [item setTitle:[@"poc poc lol" uppercaseString]];
    [item setPhoto:[UIImage imageNamed:@"fuckyea.png"]];
    
    return item;
}

- (void)didSelectItemAtIndexPath:(NSInteger)index
{
    TestDetailController *testNavigation = [[TestDetailController alloc] init];
    
    [self.navigationController pushViewController:testNavigation animated:YES];
}

- (NSArray *)placesForCurrentView
{
    NSArray *places = [NSArray arrayWithObjects:
                       [NSNumber numberWithInt:1],  nil];
    
    return places;
}


@end
