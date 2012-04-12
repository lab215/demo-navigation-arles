//
//  FavoritesViewController.m
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 11/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "FavoritesViewController.h"
#import "RootTableCustomCell.h"
#import "DetailArtistesViewController.h"
#import "DetailExposViewController.h"
#import "DetailLieuxViewController.h"
@implementation FavoritesViewController
@synthesize favoritesTableView;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.menuTitle = @"Favoris";
        self.menuSubTitle = @"Votre selection";
        self.menuLogo = [UIImage imageNamed:@"MENU_COEUR_OFF.png"];
        self.menuLogoOn = [UIImage imageNamed:@"MENU_COEUR_ON.png"];
    
        
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
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:(BOOL)animated];
    
    //Array contenant la liste des favoris
    favorites= [[NSMutableArray alloc]init];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    elements= [userDefaults objectForKey:@"json"];
    
    favoritesExpos = [[NSDictionary alloc] initWithDictionary:[userDefaults objectForKey:@"favoritesExpos"] ];
    favoritesArtistes = [[NSDictionary alloc] initWithDictionary:[userDefaults objectForKey:@"favoritesArtistes"] ];
    favoritesLieux = [[NSDictionary alloc] initWithDictionary:[userDefaults objectForKey:@"favoritesLieux"] ];
    favoritesEvenements = [[NSDictionary alloc] initWithDictionary:[userDefaults objectForKey:@"favoritesEvenements"] ];
    
    if (favoritesExpos && [favoritesExpos count] > 0) {
        NSArray *expos=[[NSArray alloc] initWithObjects:@"Expositions",@"expos",favoritesExpos,  nil];
        [favorites addObject:expos];   
    }
    if (favoritesArtistes && [favoritesArtistes count] > 0) {
        NSArray *evenements=[[NSArray alloc] initWithObjects:@"Artistes",@"artistes",favoritesArtistes,  nil];
        [favorites addObject:evenements];   
    }
    if (favoritesLieux && [favoritesLieux count] > 0) {
        NSArray *artistes=[[NSArray alloc] initWithObjects:@"Lieux",@"lieux",favoritesLieux,  nil];
        [favorites addObject:artistes];   
    }
    if (favoritesEvenements && [favoritesEvenements count] > 0) {
        NSArray *lieux=[[NSArray alloc] initWithObjects:@"Evenements",@"events",favoritesEvenements,  nil];
        [favorites addObject:lieux];   
    }
    
    [favoritesTableView reloadData];
    
}

- (void)viewDidUnload
{
    [self setFavoritesTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [favorites count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[favorites objectAtIndex:(NSUInteger) section] objectAtIndex:2] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSString *title = [[favorites objectAtIndex:(NSUInteger) section] objectAtIndex:0];
    return title;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.favoritesTableView heightForRow];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    RootTableCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = (RootTableCustomCell *)[self.favoritesTableView tableView:tableView cellWithTitle:@"NO TEXT" image:[UIImage imageNamed:@"yuno.jpeg"]];
    }
    
    NSArray* tempItem=[favorites objectAtIndex:(NSUInteger)indexPath.section];
    NSDictionary* tempDictionary= [tempItem objectAtIndex:2];
    
    NSUInteger theId=0;
    int i=0;
    for(NSObject *item in tempDictionary) {
        if(i==indexPath.row){
            
            theId=(NSUInteger)[[NSString stringWithFormat:@"%@",item] integerValue];
            
            break;
        }
        i++;
    }
       
    NSDictionary* currentItem = [[elements objectForKey:[tempItem objectAtIndex:1]] objectAtIndex:theId-1];
    

    cell.title.text = [currentItem objectForKey:@"title"];
    
    NSInteger imageId=[[currentItem valueForKey:@"image"] intValue] ;
    NSArray* imageUrlMiddle=[[elements objectForKey:@"images"] objectAtIndex:imageId-1 ];
    [cell.photo setImageWithURL:[NSURL URLWithString:[imageUrlMiddle valueForKey:@"small" ]]];
    
    return cell;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *currentSection = [favorites objectAtIndex:section];
       return [self.favoritesTableView tableView:tableView viewForHeaderWithLabel:[currentSection objectAtIndex:0]];
}


// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //
    
    NSArray* tempItem=[favorites objectAtIndex:(NSUInteger)indexPath.section];
    NSDictionary* tempDictionary= [tempItem objectAtIndex:2];
    
    NSUInteger theId=0;
    int i=0;
    for(NSObject *item in tempDictionary) {
        if(i==indexPath.row){
            
            theId=(NSUInteger)[[NSString stringWithFormat:@"%@",item] integerValue];
            
            break;
        }
        i++;
    }
    
    NSDictionary* currentItem = [[elements objectForKey:[tempItem objectAtIndex:1]] objectAtIndex:theId-1];
    
    //
    
     NSArray *currentSection = [favorites objectAtIndex:indexPath.section];
    
    NSString *temp=[currentSection objectAtIndex:1];
    if([temp isEqualToString:@"artistes"]){
        DetailArtistesViewController * artistesView=[[DetailArtistesViewController alloc] init];
        NSInteger artistesId=[[currentItem valueForKey:@"id"]intValue];
        [artistesView setArtisteIdByIndex:artistesId];
        [self.navigationController pushViewController:artistesView animated:YES];
    }else  if([temp isEqualToString:@"expos"]){
        DetailExposViewController * expoView=[[DetailExposViewController alloc] init];
        NSInteger exposId=[[currentItem valueForKey:@"id"]intValue];
        [expoView setExpoIdByIndex:exposId];
        [self.navigationController pushViewController:expoView animated:YES];
    }else  if([temp isEqualToString:@"lieux"]){
        DetailLieuxViewController * lieuView=[[DetailLieuxViewController alloc] init];
        NSInteger lieuId=[[currentItem valueForKey:@"id"]intValue];
        [lieuView setLieuxIdByIndex:lieuId];
        [self.navigationController pushViewController:lieuView animated:YES];
    }
        
    
	
}
@end
