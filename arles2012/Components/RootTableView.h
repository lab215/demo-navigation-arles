//
//  RootTableView.h
//  arles2012
//
//  Created by Franco Bouly on 1/8/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

// @todo: Sera hérité par des classes de customisation de tableViews


#import <UIKit/UIKit.h>
#import "RootTableCustomCell.h"
#import "UIImageView+WebCache.h"

@interface RootTableView : UITableView <UITableViewDelegate>

- (UIView *)tableView:(UITableView *)tableView viewForHeaderWithLabel:(NSString *)theLabel;
- (UITableViewCell *)tableView:(UITableView *)tableView cellWithTitle:(NSString *)title image:(UIImage *)image;
- (CGFloat)heightForRow;

@end
