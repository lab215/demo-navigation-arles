//
//  TestController.m
//  ViewDeckExample
//
//  Created by Franco Bouly on 1/5/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "TestController.h"
#import "TestDetailController.h"

@implementation TestController
@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.menuTitle = @"Y U NO CLICK ?";
        self.menuSubTitle = @"CUZ YOU SHOULD";
        self.menuLogo = [UIImage imageNamed:@"MENU_INFO_OFF.png"];
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
    
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)pushMe:(id)sender {
    TestDetailController *testDetail = [[TestDetailController alloc] initWithNibName:@"TestDetailController" bundle:nil];
    [self.navigationController pushViewController:testDetail animated:YES];
}

#pragma mark TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.tableView tableView:tableView cellWithTitle:@"LOL" image:[UIImage imageNamed:@"yuno.jpeg"]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.tableView heightForRow];
}





@end
