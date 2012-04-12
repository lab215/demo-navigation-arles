//
//  CenterInfosItem.m
//  arles2012
//
//  Created by Eleve on 23/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "CenterInfosItem.h"
#import <QuartzCore/QuartzCore.h>

@implementation CenterInfosItem

@synthesize title = _title;
@synthesize photo = _photo;

- (UIImageView *) getPhotoImage
{
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 56, 56)];
    
    [image setImageWithURL:[NSURL URLWithString:self.photo]];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setClipsToBounds:YES];
    [image setBackgroundColor:[UIColor clearColor]];
    [image.layer setBorderColor:[UIColor whiteColor].CGColor];
    [image.layer setBorderWidth:2.0];
    
    return image;
}

- (UILabel *) getTitleLabel
{    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(65, 0, 65, 56)];
    
    [label setLineBreakMode:UILineBreakModeTailTruncation];
    [label setNumberOfLines:2];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setText:self.title];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    return label;
}

@end
