//
//  InfosExpoView.m
//  arles2012
//
//  Created by Eleve on 24/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "InfosExpoView.h"

@implementation InfosExpoView

@synthesize address = _address;
@synthesize price = _price;
@synthesize accessible = _accessible;

- (id)init
{
    self = [self initWithFrame:CGRectMake(55, 0, 210, 60)];
    if (self) {
        
        /* [self setBackgroundColor:[UIColor clearColor]];
        
        // Declarations
        UILabel *addressLabel1           = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 210, 12)];
        UILabel *addressLabel2           = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 210, 12)];
        UILabel *tarifLabel1             = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 210, 12)];
        UILabel *tarifLabel2             = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 210, 12)];
        UILabel *accessibleLabel         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 210, 12)];
        UIImageView *accessibleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 210, 12)];
        
        // Styles
        UIFont *fontStyleDefault    = [UIFont fontWithName:@"Helvetica" size:12];
        UIFont *fontStyleBold       = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        UIImage *accessibleImage    = [UIImage imageNamed:@"yuno.jpeg"];
        
        // Custom
        [addressLabel1 setBackgroundColor:[UIColor clearColor]];
        [addressLabel1 setFont:fontStyleDefault];
        addressLabel1 
        
        [addressLabel2 setBackgroundColor:[UIColor clearColor]];
        [tarifLabel1 setBackgroundColor:[UIColor clearColor]];
        [tarifLabel2 setBackgroundColor:[UIColor clearColor]];
        [accessibleLabel setBackgroundColor:[UIColor clearColor]]; */
        
    }    
    return self;
}

@end
