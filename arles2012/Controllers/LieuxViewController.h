//
//  LieuxViewController.h
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 15/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "RootTableView.h"

@interface LieuxViewController : RootViewController <UITableViewDelegate, UITableViewDataSource> {
    NSDictionary* json;
    NSArray *Lieux;
    
    NSArray *arrayOfCharacters;
    NSMutableDictionary *objectsForCharacters;
}

@property (weak, nonatomic) IBOutlet RootTableView *lieuxTableView;
-(NSArray *) sortedBySection:(NSArray*)array;
@end
