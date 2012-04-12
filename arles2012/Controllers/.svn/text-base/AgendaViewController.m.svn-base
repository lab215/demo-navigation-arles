//
//  AgendaViewController.m
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 25/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "AgendaViewController.h"
#import "DetailAgendaViewController.h"
#import "AgendaConstants.h"

#import <QuartzCore/QuartzCore.h>

@implementation AgendaViewController

@synthesize components = _components;
@synthesize mainImage = _mainImage;
@synthesize pageControl = _pageControl;
@synthesize mainCalendar = _mainCalendar;
@synthesize rootController = _rootController;
@synthesize date = _date;

- initWithDateComponents:(NSDateComponents *)components 
{
    self = [super init];
    
    if (self) {
        self.components = components;
    }
    
    return self;
}

- (void)createCells
{
    int row = 0;
    int section = 0;
    
    NSDateComponents *substractComponents = [[NSDateComponents alloc] init];
    NSDateComponents *dateComponents = [self.mainCalendar components:(NSDayCalendarUnit|NSWeekdayCalendarUnit|NSMonthCalendarUnit) fromDate:self.date];
    
    if (dateComponents.weekday == 1) {
        [substractComponents setDay:-6];
    } else {
        [substractComponents setDay: -(dateComponents.weekday - 2)];
    }
    
    NSDate *startDay = [self.mainCalendar dateByAddingComponents:substractComponents toDate:self.date options:0];
    
    for (int i=0; i < 35; i++) {
        
        // Calcul des dates
        NSDateComponents *addComponents = [[NSDateComponents alloc] init];
        [addComponents setDay:1*i];
        
        NSDate *currentDate = [self.mainCalendar dateByAddingComponents:addComponents toDate:startDay options:0];
        
        // Calcul des sections/rows
        if (i%aCellPerSection == 0) {
            row = 0;
            section = i/aCellPerSection;
        } else {
            row++;
        }
        AgendaCell *newCell = [[AgendaCell alloc] 
                               initWithCalendar:self.mainCalendar 
                               atIndex:i 
                               indexPath:[NSIndexPath indexPathForRow:row inSection:section] 
                               forDate:currentDate
                               forMonth:dateComponents.month];
        [newCell setDelegate:self.rootController];        
        
        [self.view addSubview:newCell];
        
        // Ajouter les labels a lagenda view
        if (section == 0) {
            UILabel *weekday = [[UILabel alloc] initWithFrame:CGRectMake(newCell.frame.origin.x, newCell.frame.origin.y - 23, newCell.frame.size.width, 20)];
            [weekday setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
            [weekday setTextColor:[UIColor whiteColor]];
            [weekday setBackgroundColor:[UIColor clearColor]];
            [weekday setTextAlignment:UITextAlignmentCenter];
            
            switch (row) {
                case 0:
                    [weekday setText:@"lun."];
                    break;
                case 1:
                    [weekday setText:@"mar."];
                    break;
                case 2:
                    [weekday setText:@"mer."];
                    break;
                case 3:
                    [weekday setText:@"jeu."];
                    break;
                case 4:
                    [weekday setText:@"ven."];
                    break;
                case 5:
                    [weekday setText:@"sam."];
                    break;
                case 6:
                    [weekday setText:@"dim."];
                    break;
            }
            
            [self.view addSubview:weekday];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - AgendaCell Delegate

- (void)didTapCellAtDate:(NSDate *)date
{
    NSLog(@"didtouch");
    DetailAgendaViewController *detailAgenda = [[DetailAgendaViewController alloc] init];
    [detailAgenda setDate:date];
    [self.rootController.navigationController pushViewController:detailAgenda animated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    // Changer l'image de fond
    NSString *backgroundImageString;
    
    switch (self.components.month) {
        case 7:
            backgroundImageString = @"agenda_juillet.jpg";
            break;
        case 8:
            backgroundImageString = @"agenda_aout.jpg";
            break;
        case 9:
        default:
            backgroundImageString = @"agenda_septembre.jpg";
            break;
    }
    [self setMainImage:[UIImage imageNamed:backgroundImageString]];
    
    // Background Image
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:self.mainImage];
    [backgroundImage setContentMode:UIViewContentModeTopLeft];
    [backgroundImage setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:backgroundImage];
    
    // Mask
    UIImageView *maskView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [maskView setImage:[UIImage imageNamed:@"agenda_mask"]];
    [maskView setContentMode:UIViewContentModeTop];
    [self.view addSubview:maskView];  
    
    // Gestion des dates
    self.mainCalendar = [NSCalendar currentCalendar];
    
    self.date = [self.mainCalendar dateFromComponents:self.components];
    
    // Mois
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM yyyy"];
    
    NSLog(@"Date:%@",self.date.description);
    
    UILabel *monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 23, 280, 33)];
    [monthLabel setText:[[dateFormatter stringFromDate:self.date] uppercaseString]];
    [monthLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:23]];
    [monthLabel setTextAlignment:UITextAlignmentLeft];
    [monthLabel setBackgroundColor:[UIColor clearColor]];
    [monthLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:monthLabel];
    
    // Separateur
    UIImageView *separator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"detail_list_bg"]];
    [separator setFrame:CGRectMake(monthLabel.frame.origin.x - 9, monthLabel.frame.origin.y, separator.image.size.width, monthLabel.frame.size.height)];
    [self.view addSubview:separator];
    
    [self createCells];
}

- (void)pageHasChanged
{
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
