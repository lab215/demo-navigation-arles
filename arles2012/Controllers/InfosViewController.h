//
//  InfosViewController.h
//  arles2012
//
//  Created by Sophie Marie on 26/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "DetailInfosViewController.h"
@interface InfosViewController : RootViewController {
    NSArray *Infos;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
-(void)configureViewWithImage:(UIImage*)image;

@end
