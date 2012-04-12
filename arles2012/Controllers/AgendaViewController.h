//
//  AgendaViewController.h
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 25/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "AgendaCell.h"

@interface AgendaViewController : UIViewController <AgendaCellDelegate> {
    NSArray *Events;
}

@property (strong,nonatomic) NSDateComponents *components;
@property (strong,nonatomic) UIImage *mainImage;
@property (strong,nonatomic) NSDate *date;
@property (strong,nonatomic) NSCalendar *mainCalendar;
@property (strong,nonatomic) UIPageControl *pageControl;
@property (strong,nonatomic) UIViewController *rootController;

- (AgendaViewController *)initWithDateComponents:(NSDateComponents *)componen; 
- (void)createCells;
- (void)didTapCell:(id)sender;
- (void)pageHasChanged;

@end
