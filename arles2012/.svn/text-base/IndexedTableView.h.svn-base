//
//  IndexedTableView.h
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 25/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootTableCustomCell.h"
#import "UIImageView+WebCache.h"

@protocol IndexedTableDelegate <NSObject>
@required

-(NSArray *)setData;
-(NSString *)setSortedKey;

@end

@interface IndexedTableView : UITableView <UITableViewDelegate>{
    
}

@property (strong, nonatomic)NSArray* indexedData;

- (UIView *)tableView:(UITableView *)tableView viewForHeaderWithLabel:(NSString *)theLabel;
- (UITableViewCell *)tableView:(UITableView *)tableView cellWithTitle:(NSString *)title image:(UIImage *)image;
- (CGFloat)heightForRow;
-(NSArray *) sortedBySection:(NSArray*)array;


@end

