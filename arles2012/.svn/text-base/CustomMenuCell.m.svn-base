//
//  CustomMenuCell.m
//  arles2012
//
//  Created by Franco Bouly on 1/7/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "CustomMenuCell.h"

@implementation CustomMenuCell
@synthesize title,subTitle;
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
        
        self.title = [[UILabel alloc ] initWithFrame:CGRectMake(61, 14, 163, 21)];
        self.title.backgroundColor = [UIColor clearColor];
        self.title.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        self.title.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.title];
        
        self.subTitle = [[UILabel alloc] initWithFrame:CGRectMake(61, 26, 176, 21)];
        self.subTitle.backgroundColor = [UIColor clearColor];
        self.subTitle.font = [UIFont fontWithName:@"Helvetica" size:8];
        self.subTitle.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.subTitle];
        
        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(22, 14, 25, 25)];
        [self.icon setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.icon];  
        
               // NSLog(@"aaaa%@",self.icon);
        
        self.accessory = [[UIImageView alloc] initWithFrame:CGRectMake(230, 12, 30, 30)];
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
