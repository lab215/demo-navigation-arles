//
//  DetailExposViewController.m
//  arles2012
//
//  Created by Eleve on 05/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailExposViewController.h"


@implementation DetailExposViewController

@synthesize artistesLabel;
@synthesize titleListLabel;
@synthesize infosView;
@synthesize addressLabel;
@synthesize horairesLabel;
@synthesize tarifLabel;
@synthesize contentScrollView;
@synthesize descriptionTextView;
@synthesize toolBar = _toolBar;
@synthesize titleLabel;
@synthesize expoImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        expos =[userDefaults objectForKey:@"expos"];
        images=[[userDefaults objectForKey:@"json"]objectForKey:@"images"];
        lieux=[[userDefaults objectForKey:@"json"]objectForKey:@"lieux"];
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"detail_background.png"]]];
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
-(void)setExpoId:(NSInteger)theId{
    currentIndex= theId ;
    expo =[expos objectAtIndex:currentIndex];
    currentId= [[expo valueForKey:@"id"]stringValue];
}
-(void)setExpoIdByIndex:(NSInteger)theId{
    currentId= [NSString stringWithFormat:@"%i",theId] ;
    int i=0;
    for(NSArray * st in expos){
        NSInteger lieuId=[[st valueForKey:@"id"]intValue];
        if(theId == lieuId){
            currentIndex=i;
        }
        i++;
    }
    expo =[expos objectAtIndex:currentIndex]; 
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}


- (void)prevAction:(UISegmentedControl*)sender
{
    currentIndex --;
    
    if (currentIndex < 0)
        currentIndex = [expos count]-1;
    
    [self setExpoId:currentIndex];
    
    [self loadData];
   
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
        
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)nextAction:(UISegmentedControl*)sender
{
    
    currentIndex ++;
    if (currentIndex >= [expos count])
        currentIndex = 0;
 
    [self setExpoId:currentIndex];

        [self loadData];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
        
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    } completion:^(BOOL finished) {
     
        

    }];
    

}

- (void) loadData{
    titleLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
    descriptionTextView.textColor= [UIColor whiteColor];
    artistesLabel.textColor= [UIColor colorWithRed:255 green:204 blue:0 alpha:1];
    
    titleListLabel.textColor= [UIColor whiteColor];
    
    self.toolBar = [[ToolBar alloc] initWithRootViewController:self];  
    self.toolBar.delegate = self;
    
    //Button back
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"navigation-back"] forState:UIControlStateNormal];
    [button setTitle:@"" forState:UIControlStateNormal];
    button.frame=CGRectMake(0.0, 0, 38.0, 28.0);
    [button addTarget:self action:@selector(backPreviousView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* deleteItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = deleteItem;
    
    // Buttons prev
    UIButton *buttonPrev = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonPrev setBackgroundImage:[UIImage imageNamed:@"navigation-prev"] forState:UIControlStateNormal];
    [buttonPrev addTarget:self action:@selector(prevAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonPrev setFrame:CGRectMake(0, 0, 38, 28)];
    
    // Buttons next
    UIButton *buttonNext = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonNext setBackgroundImage:[UIImage imageNamed:@"navigation-next"] forState:UIControlStateNormal];
    [buttonNext addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonNext setFrame:CGRectMake(45, 0, 38, 28)];
    
    UIView *nextPrevView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 76, 28)];
    [nextPrevView setBackgroundColor:[UIColor clearColor]];
    [nextPrevView addSubview:buttonPrev];
    [nextPrevView addSubview:buttonNext];
    
    UIBarButtonItem *nextPrevButton = [[UIBarButtonItem alloc] initWithCustomView:nextPrevView];
    
    self.navigationItem.rightBarButtonItem = nextPrevButton;

    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //IMAGES
    ////COVER
    NSInteger imageId=[[expo valueForKey:@"image"] intValue] ;
    NSArray *imageUrlMiddle=nil;
    imageUrlMiddle=[[[userDefaults objectForKey:@"json"] objectForKey:@"images"] objectAtIndex:imageId-1 ];
    //Image
    expoImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    expoImageView.layer.borderWidth = 4.0f;
    [expoImageView setImageWithURL:[NSURL URLWithString:[imageUrlMiddle valueForKey:@"medium" ]]];    
    
    
    ////DIAPORAMA
    NSArray* imagesTemp=[[userDefaults objectForKey:@"json"] objectForKey:@"expos_images"];
    diapos= [[NSMutableArray alloc] init ];
    [diapos addObject:imageUrlMiddle];
    for(NSObject *st in imagesTemp) {
        if([[st valueForKey:@"expo_id"]integerValue] == [currentId intValue] ){
            [diapos addObject:[[[userDefaults objectForKey:@"json"] objectForKey:@"images"] objectAtIndex:[[st valueForKey:@"image_id"]integerValue]-1 ]]; 
        }
    }
    
    //TITLE
    titleLabel.text= [[expo valueForKey:@"title"]uppercaseString];
    
    
    //ARTISTES
    NSArray *artistes=[[userDefaults objectForKey:@"json"] objectForKey:@"expos_artistes"];
    artistesSelected= [[NSMutableArray alloc] init ];
    for(NSObject *st in artistes) {
        if([[st valueForKey:@"expo_id"]integerValue] == [currentId intValue] ){
            [artistesSelected addObject:[[[userDefaults objectForKey:@"json"] objectForKey:@"artistes"] objectAtIndex:[[st valueForKey:@"artiste_id"]integerValue]-1 ]]; 
        }
    }
    
    NSString *artistesText=@"";
    BOOL first=YES;
    for(NSObject *artiste in [artistesSelected valueForKey:@"title"]) {
        if(first)
            artistesText = [NSString stringWithFormat:@"%@", artiste];
        else
            artistesText = [NSString stringWithFormat:@"%@, %@",artistesText, artiste];
        first=NO;
    }
    
    artistesLabel.text=artistesText;
    
    //DESCRIPTION
    descriptionTextView.text=[expo valueForKey:@"description"];
    //adapt heigth to its content
    CGRect frame = descriptionTextView.frame;
    frame.size.height = descriptionTextView.contentSize.height;
    descriptionTextView.frame = frame;
    
    //FAVORIS
    if ([userDefaults objectForKey:@"favoritesExpos"]) 
        favoritesExpos = [[NSMutableDictionary alloc] initWithDictionary:[userDefaults objectForKey:@"favoritesExpos"]];
    else favoritesExpos = [[NSMutableDictionary alloc] init];
    
    if([favoritesExpos valueForKey:currentId] == nil){
        toggleFavorite = NO;
        [self.toolBar setToNotFavorited];
    }else{
        toggleFavorite = YES;
        [self.toolBar setToFavorited];
    }
    
    //SCROLLVIEW HEIGHT
    [contentScrollView setScrollEnabled:YES];
    
    float totalHeight=descriptionTextView.frame.origin.y + descriptionTextView.frame.size.height ;
    [contentScrollView setContentSize:CGSizeMake( contentScrollView.frame.size.width  , totalHeight)];
    
}

- (void)backPreviousView{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [self setTitleLabel:nil];
    [self setExpoImageView:nil];
    [self setDescriptionTextView:nil];
    [self setContentScrollView:nil];
    [self setArtistesLabel:nil];
    [self setTitleListLabel:nil];
    [self setInfosView:nil];
    [self setAddressLabel:nil];
    [self setHorairesLabel:nil];
    [self setTarifLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - FGalleryViewControllerDelegate Methods
- (int)numberOfPhotosForPhotoGallery:(FGalleryViewController *)gallery
{
	return [diapos count];
}

- (FGalleryPhotoSourceType)photoGallery:(FGalleryViewController *)gallery sourceTypeForPhotoAtIndex:(NSUInteger)index
{
	return FGalleryPhotoSourceTypeNetwork;
}

- (NSString*)photoGallery:(FGalleryViewController *)gallery captionForPhotoAtIndex:(NSUInteger)index
{
	return [[diapos objectAtIndex:index]valueForKey:@"title"];
}

- (NSString*)photoGallery:(FGalleryViewController *)gallery urlForPhotoSize:(FGalleryPhotoSize)size atIndex:(NSUInteger)index {
    return [[diapos objectAtIndex:index]valueForKey:@"normal"];
}

- (IBAction)showDiapo:(id)sender {

    FGalleryViewController *networkGallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
    [self.navigationController pushViewController:networkGallery animated:YES];

}


#pragma mark ToolBarDelegate implementation

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.toolBar.isPanelUp)
        [self.toolBar slideDownPanel];
}

- (bool)shouldBeMarkedAsFavorite {
    return toggleFavorite;
}

- (void)addToFavoriteCalled{
    
    toggleFavorite=!toggleFavorite;
    if(toggleFavorite){
        [favoritesExpos setObject:currentId forKey:currentId];
    }else{
        [favoritesExpos removeObjectForKey:currentId];
    }

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *temp=[[NSDictionary alloc]initWithDictionary:favoritesExpos];
    [userDefaults setObject:temp forKey:@"favoritesExpos"];
    [userDefaults synchronize];
}

- (NSString *)linkToShare {
    return [expo valueForKey:@"share"];
}
- (UIView *)infosToDisplay {
    tarifLabel.text= [expo valueForKey:@"tarif"];
    
    
    NSUInteger placeId=[[expo valueForKey:@"lieux_id"]intValue]-1;
    NSString *place=[lieux objectAtIndex:placeId];
    addressLabel.text= [place valueForKey:@"address"];
    horairesLabel.text= [place valueForKey:@"horaire"];
    
    return infosView;
}

- (NSArray *)centerInfosToDisplay {
    NSArray *infos = [NSArray arrayWithObjects:nil];
    return infos;
}

- (NSInteger)numberOfCenterInfosItems {
    return [artistesSelected count];
}
- (CenterInfosItem *)centerInfosItemForItemAtIndex:(NSInteger)index
{
    NSDictionary *currentArtiste=[artistesSelected objectAtIndex:index];
    CenterInfosItem *item = [[CenterInfosItem alloc] init];
    [item setTitle:[currentArtiste valueForKey:@"title" ]];
    NSInteger imageId=[[currentArtiste valueForKey:@"image" ]intValue];
    [item setPhoto:[[images objectAtIndex:(NSUInteger)imageId-1] valueForKey:@"small"]];
    
    return item;
}

-(void)didSelectItemAtIndexPath:(NSInteger)index{
    DetailArtistesViewController * artisteView=[[DetailArtistesViewController alloc] init];
    NSInteger artisteId=[[[artistesSelected objectAtIndex:index]valueForKey:@"id"]intValue];
   [artisteView setArtisteIdByIndex:artisteId];
    [self.navigationController pushViewController:artisteView animated:YES];
    
}
- (NSArray *)placesForCurrentView
{
    
    NSInteger placeId=[[expo valueForKey:@"lieux_id"]intValue];
    
    NSArray *places = [NSArray arrayWithObjects:
                       [NSNumber numberWithInt:placeId],  nil];
    
    return places;
}


@end
