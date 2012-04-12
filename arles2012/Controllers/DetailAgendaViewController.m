//
//  DetailAgendaViewController.m
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 25/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "DetailAgendaViewController.h"
#import "AgendaCustumCell.h"

@implementation DetailAgendaViewController

@synthesize theTableView;
@synthesize date;
@synthesize index;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        Events=[userDefaults objectForKey:@"events"];
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
    
    //Button back
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"navigation-back"] forState:UIControlStateNormal];
    [button setTitle:@"" forState:UIControlStateNormal];
    button.frame=CGRectMake(0.0, 0, 38.0, 28.0);
    [button addTarget:self action:@selector(backPreviousView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* deleteItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = deleteItem;
    
    [self.theTableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"detail_background.png"]]];
}

- (void)viewDidUnload
{
    [self setTheTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"customMenuHeader-BG.png"]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 4, 250, 11)];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMMM yyyy"];
    
    label.text = [formatter stringFromDate:self.date];
    
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    label.textColor = [UIColor colorWithRed:255/255 green:204/255 blue:51/255 alpha:1];
    [label setTextAlignment:UITextAlignmentCenter];
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
    [tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"detail_background.png"]]];
    return view; 
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMMM yyyy"];
    return [formatter stringFromDate:self.date];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"customCell";
    
    AgendaCustumCell *cell = [self.theTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[AgendaCustumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMMM yyyy"];
    
    [self configureCell:(AgendaCustumCell *)cell forRowAtIndexPath:indexPath];
    
    //cell.textLabel.text = [[Events objectAtIndex:indexPath.row] valueForKey:@"title"];
    
    return cell;
}

- (void) configureCell:(AgendaCustumCell *)cell forRowAtIndexPath:(NSIndexPath *) indexPath
{
    cell.title.text = [[[Events objectAtIndex:indexPath.row] valueForKey:@"title"] uppercaseString];
    cell.subTitle.text = [[Events objectAtIndex:indexPath.row] valueForKey:@"animateur"];
    cell.icon.image = [UIImage imageNamed:@"detail_list_bg.png"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
    
    DetailAgendaDayViewController *controller = [[DetailAgendaDayViewController alloc] initWithRootViewController:self];
    [controller setContent:[Events objectAtIndex:indexPath.row]];
    
    [self.navigationController presentModalViewController:controller animated:YES];
}

#pragma mark - Actions

- (void)backPreviousView{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
