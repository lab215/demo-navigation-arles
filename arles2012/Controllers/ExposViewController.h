//
//  ExposViewController.h
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 08/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "RootTableView.h"


@interface ExposViewController : RootViewController <UITableViewDelegate, UITableViewDataSource> {
    NSDictionary* json;
    NSArray *Expos;
    
    NSArray *arrayOfCharacters;
    NSMutableDictionary *objectsForCharacters;
}
@property (weak, nonatomic) IBOutlet RootTableView *exposTableView;
-(NSArray *) sortedBySection:(NSArray*)array;
@end
