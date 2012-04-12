//
//  DetailExposViewController.h
//  arles2012
//
//  Created by Eleve on 05/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "FGalleryViewController.h"
#import "ToolBar.h"
#import "UIImageView+WebCache.h"
#import "DetailArtistesViewController.h"

@interface DetailExposViewController : UIViewController<UITextViewDelegate, FGalleryViewControllerDelegate,ToolBarDelegate> {    

    NSArray *expo;
    NSArray *expos;
    NSArray *lieux;
    NSInteger currentIndex;
    NSString *currentId;
    
    NSMutableArray *diapos;
    NSArray *images;
    NSMutableArray *artistesSelected;
    
    BOOL toggleFavorite;
    NSMutableDictionary *favoritesDictionnary;
    NSMutableDictionary *favoritesExpos;
    
    
    
}
@property (nonatomic, strong) ToolBar *toolBar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *expoImageView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UILabel *artistesLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleListLabel;

//INFOS VIEW
@property (strong, nonatomic) IBOutlet UIView *infosView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *horairesLabel;
@property (weak, nonatomic) IBOutlet UILabel *tarifLabel;




- (IBAction)showDiapo:(id)sender;
-(void)setExpoId:(NSInteger)theId;
-(void)setExpoIdByIndex:(NSInteger)theId;
- (void)prevAction:(UISegmentedControl*)sender;
- (void)nextAction:(UISegmentedControl*)sender;
- (void) loadData;
@end
