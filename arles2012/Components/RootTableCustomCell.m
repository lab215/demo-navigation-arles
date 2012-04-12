//
//  RootTableCustomCell.m
//  arles2012
//
//  Created by Franco Bouly on 1/22/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "RootTableCustomCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation RootTableCustomCell

@synthesize title;
@synthesize photo;
@synthesize accessory;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"EXPOS_TABLE_BACKGROUND.png"]];
        
        [self setBackgroundView:backgroundImage];
        
        // Customizing Outlets
        
        self.title = [[UILabel alloc ] initWithFrame:CGRectMake(120, 30, 150, 17)];
        self.title.backgroundColor = [UIColor clearColor];
        self.title.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        self.title.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.title];
        
        self.photo = [[UIImageView alloc] initWithFrame:CGRectMake(20, 14, 85, 50)];
        [self.photo setBackgroundColor:[UIColor clearColor]];
        [self.photo.layer setBorderColor:[UIColor whiteColor].CGColor];
        [self.photo.layer setBorderWidth:2.0];               
        [self.contentView addSubview:self.photo];     
        
        self.accessory = [[UIImageView alloc] initWithFrame:CGRectMake(270, 27, 30, 30)];
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

