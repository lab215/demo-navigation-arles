//
//  InfosViewController.m
//  arles2012
//
//  Created by Sophie Marie on 26/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "InfosViewController.h"
#import "RootViewController.h"
#import "InfosCustomCell.h"

@implementation InfosViewController
@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.menuTitle = @"Informations";
        self.menuSubTitle = @"Informations pratiques";
        self.menuLogo = [UIImage imageNamed:@"MENU_INFO_OFF.png"];
        self.menuLogoOn = [UIImage imageNamed:@"MENU_INFO_ON.png"];
        
       [self.tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"detail_background.png"]]];

        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];        
        Infos = [[userDefaults objectForKey:@"json"] objectForKey:@"informations"];    }
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

#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Infos count];
}

- (void)configureCell:(InfosCustomCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath 
{
    NSArray *icons = [NSArray arrayWithObjects:
                      [UIImage imageNamed:@"VENIR_OFF.png"],
                      [UIImage imageNamed:@"DORMIR_OFF.png"],
                      [UIImage imageNamed:@"MANGER_OFF.png"],
                      [UIImage imageNamed:@"HORAIRE_OFF.png"],
                      [UIImage imageNamed:@"GROUPE_OFF.png"],
                      [UIImage imageNamed:@"GUIDE_OFF.png"],
                      [UIImage imageNamed:@"PRO_OFF.png"],
                      [UIImage imageNamed:@"PRESS_OFF.png"],
                      [UIImage imageNamed:@"CONTACT_OFF.png"],
                      [UIImage imageNamed:@"GOBELINS_OFF.png"], nil];
    cell.title.text = [[[Infos objectAtIndex:indexPath.row] valueForKey:@"title"] uppercaseString];

    cell.icon.image = [icons objectAtIndex:indexPath.row];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"customCell";
    
    InfosCustomCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[InfosCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [self configureCell:(InfosCustomCell *)cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailInfosViewController *detailInfosViewController = [[DetailInfosViewController alloc] init];
    
    NSArray *urls = [NSArray arrayWithObjects:
                      @"http://cdnl2012.gobelins.fr/arles/g3/content/infos/contact.html",
                      @"http://cdnl2012.gobelins.fr/arles/g3/content/infos/contact.html",
                      @"http://cdnl2012.gobelins.fr/arles/g3/content/infos/contact.html",
                      @"http://cdnl2012.gobelins.fr/arles/g3/content/infos/contact.html",
                      @"http://cdnl2012.gobelins.fr/arles/g3/content/infos/contact.html",
                      @"http://cdnl2012.gobelins.fr/arles/g3/content/infos/contact.html",
                      @"http://cdnl2012.gobelins.fr/arles/g3/content/infos/contact.html",
                      @"http://cdnl2012.gobelins.fr/arles/g3/content/infos/contact.html",
                      @"http://cdnl2012.gobelins.fr/arles/g3/content/infos/contact.html",
                      @"http://cdnl2012.gobelins.fr/arles/g3/content/infos/contact.html", nil];
    [detailInfosViewController configureViewWithUrl:[urls objectAtIndex:indexPath.row]];
    
    [self.navigationController pushViewController:detailInfosViewController animated:YES];
    
    
	
}
@end