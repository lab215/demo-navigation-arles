//
//  LieuxViewController.m
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 08/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "LieuxViewController.h"
#import "DetailLieuxViewController.h"
#import "RootTableCustomCell.h"

@implementation LieuxViewController
@synthesize lieuxTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.menuTitle = @"Lieux";
        self.menuSubTitle = @"Liste des lieux";
        self.menuLogo = [UIImage imageNamed:@"MENU_LIEUX_OFF"];
        self.menuLogoOn = [UIImage imageNamed:@"MENU_LIEUX_ON"];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        Lieux=[userDefaults objectForKey:@"lieux"] ;
        
        arrayOfCharacters=[self sortedBySection:Lieux];
   
        
    }
    return self;
}
-(NSArray *) sortedBySection:(NSArray*)array
{
    //ORGANISATION PAR SECTION ALPHABETIQUE
    NSMutableArray* newArray = [[NSMutableArray alloc]init];
    NSMutableArray *tempArray= [[NSMutableArray alloc]init];
    NSMutableDictionary *tempObjectsForCharacters = [[NSMutableDictionary alloc]init];
    NSString *currentString=@"";
    int i=1;
    for(NSArray *expo in array){
        
        NSString *firstLetter=[[[expo valueForKey:@"title"] substringToIndex:1] uppercaseString];
        
        //si l'initial est differente de la precedente on cree une nouvelle section
        if(![currentString isEqualToString:firstLetter]){
            currentString=firstLetter;
            if([tempArray count]>0){
                [tempObjectsForCharacters setValue:tempArray forKey:@"itemForSection"];
            }
            //nouvelle section
            tempArray= [[NSMutableArray alloc]init];
            tempObjectsForCharacters = [[NSMutableDictionary alloc]init];
            [tempObjectsForCharacters setValue:firstLetter forKey:@"headerSection"];
            [newArray addObject:tempObjectsForCharacters];  
            
        }
        [expo setValue:[NSString stringWithFormat:@"%i",i] forKey:@"row"];
        [tempArray addObject:expo]; 
        
        i++;
        
    }
    [tempObjectsForCharacters setValue:tempArray forKey:@"itemForSection"];
    return newArray;
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
    [self setLieuxTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableviewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [arrayOfCharacters count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[[arrayOfCharacters objectAtIndex:(NSUInteger)section] objectForKey:@"itemForSection"] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *title = [[arrayOfCharacters objectAtIndex:(NSUInteger) section] valueForKey:@"headerSection"];
    return [self.lieuxTableView tableView:tableView viewForHeaderWithLabel:title];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NSUInteger row = [indexPath row];
    
    RootTableCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = (RootTableCustomCell *)[self.lieuxTableView tableView:tableView cellWithTitle:@"NO TEXT" image:[UIImage imageNamed:@"yuno.jpeg"]];
    }
    
    NSArray *currentItem=[[[arrayOfCharacters objectAtIndex:(NSUInteger)indexPath.section] valueForKey:@"itemForSection"]objectAtIndex:row];
    // A modifier
    cell.title.text = [currentItem valueForKey:@"title"];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    

    NSString *imageIdS=[currentItem valueForKey:@"image"];
    NSInteger imageId=[imageIdS intValue] ;

    NSString *imageUrlMiddle=[[[userDefaults objectForKey:@"json"] objectForKey:@"images"] objectAtIndex:imageId-1 ];
    
    [cell.photo setImageWithURL:[NSURL URLWithString:[imageUrlMiddle valueForKey:@"small"]]];
    return cell;
}

- (CGFloat)tableView:tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.lieuxTableView heightForRow];
}

// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailLieuxViewController *detailLieuxViewController = [[DetailLieuxViewController alloc] init];
    NSArray *currentItem=[[[arrayOfCharacters objectAtIndex:(NSUInteger)indexPath.section] valueForKey:@"itemForSection"]objectAtIndex:indexPath.row];
    NSInteger currentId=[[currentItem valueForKey:@"row"]integerValue] ;
    
    [detailLieuxViewController setLieuId:currentId-1];
    
    [self.navigationController pushViewController:detailLieuxViewController animated:YES];
    
    
	
}
@end
