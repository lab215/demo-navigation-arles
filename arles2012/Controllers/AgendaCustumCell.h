//
//  AgendaCustumCell.h
//  arles2012
//
//  Created by Franco Bouly on 1/27/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgendaCustumCell : UITableViewCell

@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UILabel *subTitle;
@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UIImage *iconOn;
@property (strong, nonatomic) UIImageView *accessory;

@end
