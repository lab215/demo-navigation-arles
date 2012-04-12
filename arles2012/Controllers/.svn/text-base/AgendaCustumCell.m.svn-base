//
//  AgendaCustumCell.m
//  arles2012
//
//  Created by Franco Bouly on 1/27/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "AgendaCustumCell.h"

@implementation AgendaCustumCell
@synthesize subTitle;
@synthesize title;
@synthesize icon;
@synthesize iconOn;
@synthesize accessory;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"customMenuCell-BG.png"]];
        
        [self setBackgroundView:backgroundImage];
        
        // Customizing Outlets
        
        self.title = [[UILabel alloc ] initWithFrame:CGRectMake(40, 6, 163, 25)];
        self.title.backgroundColor = [UIColor clearColor];
        self.title.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        self.title.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.title];
        
        self.subTitle = [[UILabel alloc ] initWithFrame:CGRectMake(40, 26, 163, 15)];
        self.subTitle.backgroundColor = [UIColor clearColor];
        self.subTitle.font = [UIFont fontWithName:@"Helvetica" size:13];
        self.subTitle.textColor = [UIColor colorWithRed:255 green:204 blue:51 alpha:1];
        [self.contentView addSubview:self.subTitle];
        
        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(25, 14, 2, 25)];
        [self.icon setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.icon];  
        
        self.accessory = [[UIImageView alloc] initWithFrame:CGRectMake(270, 12, 30, 30)];
        [self.accessory setBackgroundColor:[UIColor clearColor]];
        [self.accessory setImage:[UIImage imageNamed:@"TABLEVIEW_ACCESSORY.png"]];
        [self.contentView addSubview:self.accessory];  
        
        UIView *view = [[UIView alloc] initWithFrame:self.frame];
        [view setBackgroundColor:[UIColor blackColor]];
        self.selectedBackgroundView = view;
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
