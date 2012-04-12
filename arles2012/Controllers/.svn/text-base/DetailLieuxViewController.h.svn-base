
//
//  DetailLieuxViewController.h
//  arles2012
//
//  Created by Eleve on 05/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "ToolBar.h"
#import "UIImageView+WebCache.h"
#import "DetailExposViewController.h"

@interface DetailLieuxViewController : UIViewController<UITextViewDelegate,ToolBarDelegate> {    
    
    NSArray *lieu;
    
    NSArray *lieux;
    NSArray *expos;
    NSInteger currentIndex;
    NSString *currentId;
    

    NSArray *images;
    NSMutableArray *exposSelected;
    
    BOOL toggleFavorite;
    NSMutableDictionary *favoritesDictionnary;
    NSMutableDictionary *favoritesLieux;
    
    
    
}
@property (nonatomic, strong) ToolBar *toolBar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *lieuxImageView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

//INFOS VIEW
@property (strong, nonatomic) IBOutlet UIView *infosView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *horairesLabel;
@property (weak, nonatomic) IBOutlet UILabel *openDayLabel;

-(void)setLieuxIdByIndex:(NSInteger)theId;
-(void)setLieuId:(NSInteger)theId;
- (void)prevAction:(UISegmentedControl*)sender;
- (void)nextAction:(UISegmentedControl*)sender;
- (void) loadData;
@end
