//
//  ToolBar.h
//  arles2012
//
//  Created by Eleve on 13/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMGridView.h"
#import "CenterInfosItem.h"
#import "GeolocViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@protocol ToolBarDelegate <NSObject>

@required

- (bool)shouldBeMarkedAsFavorite;
- (void)addToFavoriteCalled;
- (NSString *)linkToShare;
- (UIView *)infosToDisplay;
- (NSArray *)centerInfosToDisplay;
- (NSArray *)placesForCurrentView;
- (NSInteger)numberOfCenterInfosItems;
- (CenterInfosItem *)centerInfosItemForItemAtIndex:(NSInteger)index;
- (void)didSelectItemAtIndexPath:(NSInteger)index;

@end


@interface ToolBar : UIViewController <GMGridViewDataSource, GMGridViewActionDelegate, GeolocViewControllerDelegate, MFMailComposeViewControllerDelegate> {
     __gm_weak GMGridView *_gmGridView2;
}

@property (strong,nonatomic) UIViewController *rootViewController;
@property (strong,nonatomic) UIView *containerView;
@property (strong,nonatomic) UIView *maskView;
@property (weak, nonatomic) id <ToolBarDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIImageView *toolBarView;
@property (readwrite, nonatomic) BOOL isPanelUp;
@property (weak, nonatomic) IBOutlet UIButton *centerButton;


- (void)slideUpPanelWithView:(UIView *)view;
- (void)slideDownPanel;
- (void)killPanel;
- (void)setToFavorited;
- (void)setToNotFavorited;
- (void)setCenterIcon:(UIImage *)image highlighted:(UIImage *) imageOn;

- (void)shareTwitter;
- (void)shareEmail;

- (IBAction)addToFavorite:(id)sender;
- (IBAction)share:(id)sender;
- (IBAction)getInformations:(id)sender;
- (IBAction)getGeolocalisation:(id)sender;
- (IBAction)hasTouchedCenterButton:(id)sender;

- (id)initWithRootViewController:(UIViewController *)rootViewController;

@end
