//
//  AgendaCell.m
//  arles2012
//
//  Created by Franco Bouly on 1/26/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "AgendaCell.h"
#import "AgendaConstants.h"

#import <QuartzCore/QuartzCore.h>

@implementation AgendaCell

@synthesize calendar = _calendar;
@synthesize date = _date;
@synthesize delegate = _delegate;


- (AgendaCell *)initWithCalendar:(NSCalendar *)calendar atIndex:(int)index indexPath:(NSIndexPath *)indexPath forDate: (NSDate *)date forMonth:(NSInteger)month 
{
    self = [super init];
    
    if (self) {
        // Index est l'index absolu (de 0 à 34)
        // indexPath.row est le numéro de cellule (0 a 6)
        // indexPath.section est la ligne (0 a 4)
        
        int posX = aCellStartFromLeft + (indexPath.row * (aCellWidth + aCellGap));
        int posY = aCellStartFromTop + (indexPath.section * (aCellHeight + aCellGap));
        
        self.calendar = calendar;
        self.date = date;
        
        [self setFrame:CGRectMake(posX, posY, aCellWidth, aCellHeight)];
        [self setBackgroundColor:[UIColor clearColor]];
        
        [self.layer setBackgroundColor:[UIColor clearColor].CGColor];
        [self.layer setCornerRadius:5];
        
        UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 24, self.frame.size.width - 4, 20)];
        [dateLabel setBackgroundColor:[UIColor clearColor]];
        [dateLabel setTextColor:[UIColor whiteColor]];
        [dateLabel setTextAlignment:UITextAlignmentRight];
        [dateLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        
        NSDateComponents *dateComps = [self.calendar components:(NSDayCalendarUnit|NSMonthCalendarUnit) fromDate:self.date];
        NSDate *today = [NSDate date];
        NSDateComponents *todayComps = [self.calendar components:(NSDayCalendarUnit) fromDate:today];
        
        if (dateComps.day == todayComps.day) {
            [self setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:1 alpha:0.5]];
        }
        
        if (dateComps.month != month) {
            [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
        }
        
        [dateLabel setText:[NSString stringWithFormat:@"%d",dateComps.day]];

        [self addSubview:dateLabel];
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.5 animations:^{
        [self setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:0.5]];
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
           NSLog(@"self.delegate  %@",self.delegate );
    NSLog(@"self.delegate class %@",[self.delegate class]);
 
    [self.delegate didTapCellAtDate:self.date];
    [UIView animateWithDuration:0.5 animations:^{
        [self setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:0]];
    }];
}

@end
