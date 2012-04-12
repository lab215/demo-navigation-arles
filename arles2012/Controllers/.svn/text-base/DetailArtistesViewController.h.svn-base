//
//  DetailArtistesViewController.h
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 15/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ToolBar.h"
#import "UIImageView+WebCache.h"
#import "DetailExposViewController.h"

@interface DetailArtistesViewController :  UIViewController<UITextViewDelegate,ToolBarDelegate> {    
    
    NSArray *artiste;
    NSArray *artistes;
    
    NSArray *expos;
    NSArray *lieux;
    NSInteger currentIndex;
    NSString *currentId;
    
    NSArray *images;
    NSMutableArray *exposSelected;
    NSMutableArray *lieuxIdSelected;
    BOOL toggleFavorite;
    NSMutableDictionary *favoritesDictionnary;
    NSMutableDictionary *favoritesArtistes;
    
    
    
}
@property (nonatomic, strong) ToolBar *toolBar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *artisteImageView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

//INFOS VIEW
@property (strong, nonatomic) IBOutlet UIView *infosView;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;
@property (weak, nonatomic) IBOutlet UILabel *horairesLabel;
@property (weak, nonatomic) IBOutlet UILabel *openDayLabel;


-(void)setArtisteId:(NSInteger)theId;
-(void)setArtisteIdByIndex:(NSInteger)theId;
- (void)prevAction:(UISegmentedControl*)sender;
- (void)nextAction:(UISegmentedControl*)sender;
- (void) loadData;
@end
