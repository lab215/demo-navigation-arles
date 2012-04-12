//
//  infosCustomCell.m
//  arles2012
//
//  Created by Eleve on 1/7/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "InfosCustomCell.h"

@implementation InfosCustomCell
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
        
        self.title = [[UILabel alloc ] initWithFrame:CGRectMake(75, 16, 163, 25)];
        self.title.backgroundColor = [UIColor clearColor];
        self.title.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        self.title.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.title];
        
        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(25, 14, 25, 25)];
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

- (void)setHover:(UIImage*)image{
    [self.icon setHighlightedImage:image];
}

@end
