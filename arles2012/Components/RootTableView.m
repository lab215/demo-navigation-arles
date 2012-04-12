//
//  RootTableView.m
//  arles2012
//
//  Created by Franco Bouly on 1/8/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "RootTableView.h"

@implementation RootTableView

- (void)awakeFromNib {
    [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self setBackgroundColor:[UIColor darkGrayColor]];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderWithLabel:(NSString *)theLabel
{
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"customMenuHeader-BG.png"]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 4, 250, 11)];
    
    label.text = [theLabel uppercaseString];
    
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    label.textColor = [UIColor lightGrayColor];
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
     [tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"detail_background.png"]]];
    return view;
}

- (RootTableCustomCell *)tableView:(UITableView *)tableView cellWithTitle:(NSString *)title image:(UIImage *)image
{
    static NSString *CellIdentifier = @"rootTableCustomCell";
    
     RootTableCustomCell *cell = [self dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[RootTableCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.title setText:title];
    [cell.photo setImage:image];
    
    return cell;
}

- (CGFloat)heightForRow
{
    return 75.0;
}


@end
