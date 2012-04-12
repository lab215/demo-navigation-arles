//
//  AgendaCell.h
//  arles2012
//
//  Created by Franco Bouly on 1/26/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AgendaCellDelegate <NSObject>

- (void) didTapCellAtDate:(NSDate *)date;

@end

@interface AgendaCell : UIView

@property (strong, nonatomic) NSCalendar *calendar;
@property (strong, nonatomic) NSDate *date;
@property (weak, nonatomic) id <AgendaCellDelegate> delegate;

- (AgendaCell *)initWithCalendar:(NSCalendar *)calendar atIndex:(int)index indexPath:(NSIndexPath *)indexPath forDate: (NSDate *)date forMonth:(NSInteger)month;

@end
