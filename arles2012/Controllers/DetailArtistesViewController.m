//
//  DetailArtistesViewController.m
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 15/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "DetailArtistesViewController.h"

@implementation DetailArtistesViewController

@synthesize infosView;
@synthesize contactLabel;
@synthesize horairesLabel;

@synthesize openDayLabel;
@synthesize contentScrollView;
@synthesize descriptionTextView;
@synthesize toolBar = _toolBar;
@synthesize titleLabel;
@synthesize artisteImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        expos =[[userDefaults objectForKey:@"json"]objectForKey:@"expos"];
        lieux =[[userDefaults objectForKey:@"json"]objectForKey:@"lieux"];
        images=[[userDefaults objectForKey:@"json"]objectForKey:@"images"];
        artistes=[userDefaults objectForKey:@"artistes"];
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"detail_background.png"]]];
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)setArtisteId:(NSInteger)theId{
     
    currentIndex= theId ;
    
    artiste =[artistes objectAtIndex:currentIndex];
    currentId= [[artiste valueForKey:@"id"]stringValue];
    
}
-(void)setArtisteIdByIndex:(NSInteger)theId{
    
    currentId= [NSString stringWithFormat:@"%i",theId] ;
    int i=0;
   
    for(NSArray * st in artistes){
        NSInteger artisteId=[[st valueForKey:@"id"]intValue];
        if(theId == artisteId){
            currentIndex=i;
        }
        i++;
    }
    artiste =[artistes objectAtIndex:currentIndex]; 
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}


- (void)prevAction:(UISegmentedControl*)sender
{
    currentIndex --;
    
    if (currentIndex < 0)
        currentIndex = [artistes count]-1;
    
    [self setArtisteId:currentIndex];
    
    [self loadData];
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
        
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    } completion:^(BOOL finished) {
        [contentScrollView setContentOffset:CGPointMake(0, 0) animated: NO];
    }];
}

- (void)nextAction:(UISegmentedControl*)sender
{
    
    currentIndex ++;
    if (currentIndex >= [artistes count])
        currentIndex = 0;
    
    [self setArtisteId:currentIndex];
    
    [self loadData];
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
        
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    } completion:^(BOOL finished) {
        
        [contentScrollView setContentOffset:CGPointMake(0, 0) animated: NO];
        
    }];
    
    
}

- (void) loadData{
    titleLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
    descriptionTextView.textColor= [UIColor whiteColor];
    
    self.toolBar = [[ToolBar alloc] initWithRootViewController:self];  
    self.toolBar.delegate = self;
    [self.toolBar setCenterIcon:[UIImage imageNamed:@"TABBAR_EXPOS_OFF"] highlighted:[UIImage imageNamed:@"TABBAR_EXPOS_ON"]];
    
    
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
    NSInteger imageId=[[artiste valueForKey:@"image"] intValue] ;
    NSArray *imageUrlMiddle=nil;
    imageUrlMiddle=[[[userDefaults objectForKey:@"json"] objectForKey:@"images"] objectAtIndex:imageId-1 ];
    //Image
    artisteImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    artisteImageView.layer.borderWidth = 4.0f;
    [artisteImageView setImageWithURL:[NSURL URLWithString:[imageUrlMiddle valueForKey:@"medium" ]]];    
    
    
    //TITLE
    titleLabel.text= [[artiste valueForKey:@"title"]uppercaseString];
    
    
    //EXPOSITIONS
    NSArray *expositions=[[userDefaults objectForKey:@"json"] objectForKey:@"expos_artistes"];
    exposSelected= [[NSMutableArray alloc] init ];
    lieuxIdSelected= [[NSMutableArray alloc] init ];
    for(NSObject *st in expositions) {
        if([[st valueForKey:@"artiste_id"]integerValue] == [currentId intValue] ){
            NSArray *currentExpo =[expos objectAtIndex:[[st valueForKey:@"expo_id"]integerValue]-1 ];
            [exposSelected addObject:currentExpo];
            NSNumber *lieuId=(NSNumber *)[currentExpo valueForKey:@"lieux_id"];
            [lieuxIdSelected addObject:lieuId];
        }
    }
    
    //DESCRIPTION
    descriptionTextView.text=[artiste valueForKey:@"description"];
    //adapt heigth to its content
    CGRect frame = descriptionTextView.frame;
    frame.size.height = descriptionTextView.contentSize.height;
    descriptionTextView.frame = frame;
    
    //FAVORIS
    if ([userDefaults objectForKey:@"favoritesArtistes"]) 
        favoritesArtistes = [[NSMutableDictionary alloc] initWithDictionary:[userDefaults objectForKey:@"favoritesArtistes"]];
    else favoritesArtistes = [[NSMutableDictionary alloc] init];
    
    if([favoritesArtistes valueForKey:currentId] == nil){
        toggleFavorite = NO;
        [self.toolBar setToNotFavorited];
    }else{
        toggleFavorite = YES;
        [self.toolBar setToFavorited];
    }
    
    //SCROLLVIEW HEIGHT
    float totalHeight=descriptionTextView.frame.origin.y + descriptionTextView.frame.size.height ;
    [contentScrollView setContentSize:CGSizeMake( contentScrollView.frame.size.width  , totalHeight)];
    
}

- (void)backPreviousView{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [self setTitleLabel:nil];
    [self setArtisteImageView:nil];
    [self setDescriptionTextView:nil];
    [self setContentScrollView:nil];
    
    [self setInfosView:nil];
    [self setContactLabel:nil];
    [self setHorairesLabel:nil];
    
    [self setOpenDayLabel:nil];
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
    return toggleFavorite;
}

- (void)addToFavoriteCalled{
    
    toggleFavorite=!toggleFavorite;
    if(toggleFavorite){
        [favoritesArtistes setObject:currentId forKey:currentId];
    }else{
        [favoritesArtistes removeObjectForKey:currentId];
    }
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *temp=[[NSDictionary alloc]initWithDictionary:favoritesArtistes];
    [userDefaults setObject:temp forKey:@"favoritesArtistes"];
    [userDefaults synchronize];
}

- (NSString *)linkToShare {
    return [artiste valueForKey:@"share"];
}
- (UIView *)infosToDisplay {
    
    
    //openDayLabel.text= [expo valueForKey:@"tarif"];
    contactLabel.text= [artiste valueForKey:@"contact"];
    
    return infosView;
}

- (NSArray *)centerInfosToDisplay {
    NSArray *infos = [NSArray arrayWithObjects:nil];
    return infos;
}

- (NSInteger)numberOfCenterInfosItems {
    return [exposSelected count];
}
- (CenterInfosItem *)centerInfosItemForItemAtIndex:(NSInteger)index
{
    NSDictionary *currentExpo=[exposSelected objectAtIndex:index];
    CenterInfosItem *item = [[CenterInfosItem alloc] init];
    [item setTitle:[currentExpo valueForKey:@"title"]];
    NSInteger imageId=[[currentExpo valueForKey:@"image" ]intValue];
    [item setPhoto:[[images objectAtIndex:(NSUInteger)imageId-1] valueForKey:@"small"]];
    return item;
}

-(void)didSelectItemAtIndexPath:(NSInteger)index{

    DetailExposViewController * expoView=[[DetailExposViewController alloc] init];
    NSInteger exposId=[[[exposSelected objectAtIndex:index]valueForKey:@"id"]intValue];
    [expoView setExpoIdByIndex:exposId];
    [self.navigationController pushViewController:expoView animated:YES];
    
}
- (NSArray *)placesForCurrentView
{
    
    NSArray *places = lieuxIdSelected;
    return places;
}


@end
