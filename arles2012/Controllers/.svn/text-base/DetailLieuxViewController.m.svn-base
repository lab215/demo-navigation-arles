//
//  DetailExposViewController.m
//  arles2012
//
//  Created by Eleve on 05/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailLieuxViewController.h"


@implementation DetailLieuxViewController

@synthesize infosView;
@synthesize addressLabel;
@synthesize horairesLabel;

@synthesize openDayLabel;
@synthesize contentScrollView;
@synthesize descriptionTextView;
@synthesize toolBar = _toolBar;
@synthesize titleLabel;
@synthesize lieuxImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
     
        // Custom initialization
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        expos =[[userDefaults objectForKey:@"json"]objectForKey:@"expos"];
        images=[[userDefaults objectForKey:@"json"]objectForKey:@"images"];
        lieux=[userDefaults objectForKey:@"lieux"];
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
-(void)setLieuId:(NSInteger)theId{
  
    currentIndex= theId ;
    lieu =[lieux objectAtIndex:currentIndex];
    currentId= [[lieu valueForKey:@"id"]stringValue];

}
-(void)setLieuxIdByIndex:(NSInteger)theId{
    
    currentId= [NSString stringWithFormat:@"%i",theId] ;
    int i=0;
    for(NSArray * st in lieux){
        NSInteger lieuId=[[st valueForKey:@"id"]intValue];
        if(theId == lieuId){
            currentIndex=i;
        }
        i++;
    }
    lieu =[lieux objectAtIndex:currentIndex]; 
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}


- (void)prevAction:(UISegmentedControl*)sender
{
    currentIndex --;
    
    if (currentIndex < 0)
        currentIndex = [lieux count]-1;
    
    [self setLieuId:currentIndex];
    
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
    if (currentIndex >= [lieux count])
        currentIndex = 0;
    
    [self setLieuId:currentIndex];
    
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
    [self.toolBar setCenterIcon:[UIImage imageNamed:@"TABBAR_ARTISTES_OFF"] highlighted:[UIImage imageNamed:@"TABBAR_ARTISTES_ON"]];
    
    
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
    NSInteger imageId=[[lieu valueForKey:@"image"] intValue] ;
    NSArray *imageUrlMiddle=nil;
    imageUrlMiddle=[[[userDefaults objectForKey:@"json"] objectForKey:@"images"] objectAtIndex:imageId-1 ];
    //Image
    lieuxImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    lieuxImageView.layer.borderWidth = 4.0f;
    [lieuxImageView setImageWithURL:[NSURL URLWithString:[imageUrlMiddle valueForKey:@"medium" ]]];    
    
    
    //TITLE
    titleLabel.text= [[lieu valueForKey:@"title"]uppercaseString];
    
    
    //EXPOSITIONS
    NSArray *expositions=[[userDefaults objectForKey:@"json"] objectForKey:@"expos_lieux"];
    exposSelected= [[NSMutableArray alloc] init ];
    for(NSObject *st in expositions) {
        if([[st valueForKey:@"lieux_id"]integerValue] == [currentId intValue] ){
            [exposSelected addObject:[[[userDefaults objectForKey:@"json"] objectForKey:@"expos"] objectAtIndex:[[st valueForKey:@"expo_id"]integerValue]-1 ]]; 
        }
    }
    

    //DESCRIPTION
    descriptionTextView.text=[lieu valueForKey:@"description"];
    //adapt heigth to its content
    CGRect frame = descriptionTextView.frame;
    frame.size.height = descriptionTextView.contentSize.height;
    descriptionTextView.frame = frame;
    
    //FAVORIS
    if ([userDefaults objectForKey:@"favoritesLieux"]) 
        favoritesLieux = [[NSMutableDictionary alloc] initWithDictionary:[userDefaults objectForKey:@"favoritesLieux"]];
    else favoritesLieux = [[NSMutableDictionary alloc] init];
    
    if([favoritesLieux valueForKey:currentId] == nil){
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
    [self setLieuxImageView:nil];
    [self setDescriptionTextView:nil];
    [self setContentScrollView:nil];

    [self setInfosView:nil];
    [self setAddressLabel:nil];
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
        [favoritesLieux setObject:currentId forKey:currentId];
    }else{
        [favoritesLieux removeObjectForKey:currentId];
    }

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *temp=[[NSDictionary alloc]initWithDictionary:favoritesLieux];
    [userDefaults setObject:temp forKey:@"favoritesLieux"];
    [userDefaults synchronize];
}

- (NSString *)linkToShare {
    return [lieu valueForKey:@"share"];
}
- (UIView *)infosToDisplay {
   
    addressLabel.text= [lieu valueForKey:@"address"];
    horairesLabel.text= [lieu valueForKey:@"horaire"];
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
    [item setTitle:[currentExpo valueForKey:@"title" ]];
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
    NSInteger placeId=[[lieu valueForKey:@"id"]intValue];
    NSArray *places = [NSArray arrayWithObjects:
                       [NSNumber numberWithInt:placeId],  nil];
    return places;
}


@end
