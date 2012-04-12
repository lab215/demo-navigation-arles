//
//  ArtistesViewController.h
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 15/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "RootTableView.h"

@interface ArtistesViewController :  RootViewController <UITableViewDelegate, UITableViewDataSource> {
    NSDictionary* json;
    NSArray *Artistes;
    
    NSArray *arrayOfCharacters;
    NSMutableDictionary *objectsForCharacters;
}

@property (weak, nonatomic) IBOutlet RootTableView *artistesTableView;
-(NSArray *) sortedBySection:(NSArray*)array;@end
