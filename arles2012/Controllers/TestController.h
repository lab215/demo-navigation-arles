//
//  TestController.h
//  ViewDeckExample
//
//  Created by Franco Bouly on 1/5/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "RootViewController.h"
#import "RootTableView.h"

@interface TestController : RootViewController <UITableViewDelegate, UITableViewDelegate>
- (IBAction)pushMe:(id)sender;
@property (weak, nonatomic) IBOutlet RootTableView *tableView;

@end
