//
//  ToolBar.m
//  arles2012
//
//  Created by Eleve on 13/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "ToolBar.h"
#import "GMGridView.h"
#import "GMGridViewCell.h"
#import "GMGridViewLayoutStrategies.h"
#import "CenterInfosItem.h"
#import "GeolocViewController.h"

#import <QuartzCore/QuartzCore.h>
#import <Twitter/Twitter.h>

@implementation ToolBar
@synthesize favoriteButton = _favoriteButton;
@synthesize toolBarView = _toolBarView;
@synthesize maskView = _maskView;

@synthesize rootViewController = _rootViewController;
@synthesize containerView = _containerView;
@synthesize delegate = _delegate;
@synthesize isPanelUp = _isPanelUp;
@synthesize centerButton = _centerButton;


-(id)initWithRootViewController:(UIViewController *)rootViewController {
    
    self = [super initWithNibName:@"ToolBar" bundle:nil]; 
    
    self.rootViewController = rootViewController;

    [self.rootViewController.view addSubview:self.view];
    
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
    
    //[self.view setFrame:CGRectMake(0, self.rootViewController.view.frame.size.height - self.view.frame.size.height, 320, self.view.frame.size.height)];
    [self.view setFrame:CGRectMake(0, self.rootViewController.view.frame.size.height - self.toolBarView.frame.size.height, 320, self.toolBarView.frame.size.height)];
    
    if ([self.delegate shouldBeMarkedAsFavorite]) {
        [self.favoriteButton setImage:[UIImage imageNamed:@"TABBAR_COEUR_ON.png"] forState:UIControlStateNormal];
        [self.favoriteButton setHighlighted:YES];
    }
}

- (void)viewDidUnload
{
    [self setFavoriteButton:nil];
    [self setToolBarView:nil];
    [self setCenterButton:nil];
    [super viewDidUnload];
    
    self.rootViewController = nil;
    self.containerView = nil;
    self.delegate = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Interface

- (void)slideUpPanelWithView:(UIView *)view {
    
    if (self.containerView) {
        [self slideDownPanel];
        return;
    }
    
    // Set le mask noir
    self.maskView = [[UIView alloc] initWithFrame:self.rootViewController.view.frame];
    [self.maskView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    //[self.rootViewController.view addSubview:self.maskView];
    [self.rootViewController.view insertSubview:self.maskView atIndex:[[self.rootViewController.view subviews] indexOfObject:self.view]];
    
    // Reset le frame
    [self.view setFrame:CGRectMake(0,self.rootViewController.view.frame.size.height - (view.frame.size.height + 50), 320, (view.frame.size.height + 50))]; 
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, view.frame.size.height + 50)];
    self.containerView.backgroundColor = [UIColor colorWithRed:32.0/255.0 green:32.0/255.0 blue:32.0/255.0 alpha:1.0];     
    
    UIView *border = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    border.backgroundColor = [UIColor colorWithRed:69.0/255 green:69.0/255 blue:69.0/255 alpha:1.0];
    [self.containerView addSubview:border];
    
    [self.view addSubview:self.containerView];
    [self.view sendSubviewToBack:self.containerView];
    
    [self.containerView addSubview:view];
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self.containerView setFrame:CGRectMake(0, (self.view.frame.size.height - self.containerView.frame.size.height), 320, self.containerView.frame.size.height)];
        [self.maskView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    } completion:^(BOOL finished) {
        self.isPanelUp = YES;
    }];
}

- (void)slideDownPanel {
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self.containerView setFrame:CGRectMake(0, self.view.frame.size.height, 320, self.containerView.frame.size.height)];
        [self.maskView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    } completion:^(BOOL finished) {
        // Reset le frame
        [self.view setFrame:CGRectMake(0, self.rootViewController.view.frame.size.height - self.toolBarView.frame.size.height, 320, self.toolBarView.frame.size.height)];
        
        [self.containerView removeFromSuperview];
        self.containerView = nil;
        
        [self.maskView removeFromSuperview];
        self.maskView = nil;
        
        self.isPanelUp = NO;
    }];
}

- (void)killPanel
{  
    [self.view setFrame:CGRectMake(0, self.rootViewController.view.frame.size.height - self.toolBarView.frame.size.height, 320, self.toolBarView.frame.size.height)];
    
    [self.containerView removeFromSuperview];
    self.containerView = nil;
    
    [self.maskView removeFromSuperview];
    self.maskView = nil;
    
    self.isPanelUp = NO;
}

- (void)setToFavorited {
    [self.favoriteButton setImage:[UIImage imageNamed:@"TABBAR_COEUR_ON.png"] forState:UIControlStateNormal];
}

- (void)setToNotFavorited {
    [self.favoriteButton setImage:[UIImage imageNamed:@"TABBAR_COEUR_OFF.png"] forState:UIControlStateNormal];
}

-(void)setCenterIcon:(UIImage *)image highlighted:(UIImage*) imageOn{
    [self.centerButton setImage:image forState:UIControlStateNormal];
    [self.centerButton setImage:imageOn forState:UIControlStateHighlighted];
}

#pragma mark - Actions

- (IBAction)addToFavorite:(id)sender {
    [self.delegate addToFavoriteCalled];
    if ([self.delegate shouldBeMarkedAsFavorite])
        [self setToFavorited];
    else
        [self setToNotFavorited];
        
}

- (IBAction)share:(id)sender {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
    
    UIButton *twitter = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *facebook = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *email = [UIButton buttonWithType:UIButtonTypeCustom];

    UIFont *fontDefault = [UIFont fontWithName:@"Helvetica" size:12.0];
    UILabel *twitterLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 67, 53, 15)];
    UILabel *facebookLabel = [[UILabel alloc] initWithFrame:CGRectMake(136, 67, 53, 15)];
    UILabel *emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(223, 67, 53, 15)];
    [twitterLabel setFont:fontDefault];
    [facebookLabel setFont:fontDefault];
    [emailLabel setFont:fontDefault];
    [twitterLabel setTextColor:[UIColor whiteColor]];
    [facebookLabel setTextColor:[UIColor whiteColor]];
    [emailLabel setTextColor:[UIColor whiteColor]];
    [twitterLabel setBackgroundColor:[UIColor clearColor]];
    [facebookLabel setBackgroundColor:[UIColor clearColor]];
    [emailLabel setBackgroundColor:[UIColor clearColor]];
    [twitterLabel setTextAlignment:UITextAlignmentCenter];
    [facebookLabel setTextAlignment:UITextAlignmentCenter];
    [emailLabel setTextAlignment:UITextAlignmentCenter];
    
    [twitter setFrame:CGRectMake(45, 15, 53, 51)];
    [facebook setFrame:CGRectMake(136, 15, 53, 51)];
    [email setFrame:CGRectMake(223, 15, 53, 51)];
    
    [twitter setBackgroundImage:[UIImage imageNamed:@"share_twitter"]forState:UIControlStateNormal];
    [facebook setBackgroundImage:[UIImage imageNamed:@"share_facebook"] forState:UIControlStateNormal];
    [email setBackgroundImage:[UIImage imageNamed:@"share_mail"] forState:UIControlStateNormal];
    
    [twitterLabel setText:@"Twitter"];
    [facebookLabel setText:@"Facebook"];
    [emailLabel setText:@"Email"];
    
    [view addSubview:twitter];
    [view addSubview:facebook];
    [view addSubview:email];
    
    [view addSubview:twitterLabel];
    [view addSubview:facebookLabel];
    [view addSubview:emailLabel];
    
    // Actions
    [twitter addTarget:self action:@selector(shareTwitter) forControlEvents:UIControlEventTouchUpInside];
    [email addTarget:self action:@selector(shareEmail) forControlEvents:UIControlEventTouchUpInside];
    
    [self slideUpPanelWithView:view];
}

# pragma mark - Share actions

- (void)shareTwitter
{
    NSString *msgToShare = [self.delegate linkToShare];
    
    if (!msgToShare)
        msgToShare = @"Pas de lien";
    
    TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
    [tweetSheet setInitialText:msgToShare];
    [self presentModalViewController:tweetSheet animated:YES];
}

- (void)shareEmail
{
    MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
    mailViewController.mailComposeDelegate = self;
    [mailViewController setSubject:@"Article sur le Festival de Photo d'Arles"];
    [mailViewController setMessageBody:@"Your message goes here." isHTML:NO];
    [self.rootViewController.navigationController setNavigationBarHidden:YES animated:YES];
    [self presentModalViewController:mailViewController animated:YES];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissModalViewControllerAnimated:YES];
    [self.rootViewController.navigationController setNavigationBarHidden:NO animated:YES];
    [self killPanel];
}

#pragma mark - IBActions

- (IBAction)getInformations:(id)sender {

    UIView *infosView=[[UIView alloc]init];
    infosView = [self.delegate infosToDisplay];
    [infosView setBackgroundColor: [UIColor clearColor]];
    [self slideUpPanelWithView:infosView];
}

- (IBAction)getGeolocalisation:(id)sender {
    GeolocViewController *geolocController = [[GeolocViewController alloc] initWithPlaces:[self.delegate placesForCurrentView]];
    geolocController.delegate = self;    
    UINavigationController *navGeoloc = [[UINavigationController alloc] initWithRootViewController:geolocController];   
    [self presentModalViewController:navGeoloc animated:YES];
}

- (IBAction)hasTouchedCenterButton:(id)sender {
    
    GMGridView *gmGridView2 = [[GMGridView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    gmGridView2.style = GMGridViewStylePush;
    gmGridView2.itemSpacing = 10;
    gmGridView2.minEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    gmGridView2.centerGrid = YES;
    gmGridView2.layoutStrategy = [GMGridViewLayoutStrategyFactory strategyFromType:GMGridViewLayoutHorizontal];
    
    gmGridView2.backgroundColor = [UIColor clearColor];
    
    _gmGridView2 = gmGridView2;
    
    _gmGridView2.dataSource = self;
    _gmGridView2.actionDelegate = self;
    
    [self slideUpPanelWithView:gmGridView2];    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touchesbegan");
}

#pragma mark GMGridViewDateSource

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView
{
    return [self.delegate numberOfCenterInfosItems];
}

- (CGSize)sizeForItemsInGMGridView:(GMGridView *)gridView
{
    return CGSizeMake(120, 56);
}

- (GMGridViewCell *)GMGridView:(GMGridView *)gridView cellForItemAtIndex:(NSInteger)index
{
    CGSize size = [self sizeForItemsInGMGridView:gridView];
    
    GMGridViewCell *cell = [gridView dequeueReusableCell];
    CenterInfosItem *item = [self.delegate centerInfosItemForItemAtIndex:index];
    
    if (!cell) 
    {
        cell = [[GMGridViewCell alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    [[cell subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [cell addSubview:[item getPhotoImage]];
    [cell addSubview:[item getTitleLabel]];
    
    return cell;
}

- (void)GMGridView:(GMGridView *)gridView didTapOnItemAtIndex:(NSInteger)position
{
    [self.delegate didSelectItemAtIndexPath:position];
}




@end
