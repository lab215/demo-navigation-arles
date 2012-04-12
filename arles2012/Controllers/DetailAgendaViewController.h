//
//  DetailAgendaViewController.h
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 25/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailAgendaDayViewController.h"
#import "AgendaCustumCell.h"

@interface DetailAgendaViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *Events;
}

@property (weak, nonatomic) IBOutlet UITableView *theTableView;

@property (strong, nonatomic) NSDate *date;
@property (assign, nonatomic) int index;

- (void)backPreviousView;
- (void) configureCell:(AgendaCustumCell *)cell forRowAtIndexPath:(NSIndexPath *) indexPath;

@end
