//
//  IndexedTableView.m
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 25/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import "IndexedTableView.h"

@implementation IndexedTableView
@synthesize indexedData;



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



-(NSArray *) sortedBySection:(NSArray*)array
{
    NSLog(@"sorteeed");
    //ORGANISATION PAR SECTION ALPHABETIQUE
    NSMutableArray* newArray = [[NSMutableArray alloc]init];
    NSMutableArray *tempArray= [[NSMutableArray alloc]init];
    NSMutableDictionary *tempObjectsForCharacters = [[NSMutableDictionary alloc]init];
    NSString *currentString=@"";
    int i=1;
    for(NSArray *expo in array){
        
        NSString *firstLetter=[[[expo valueForKey:@"title"] substringToIndex:1] uppercaseString];
        
        //si l'initial est differente de la precedente on cree une nouvelle section
        if(![currentString isEqualToString:firstLetter]){
            currentString=firstLetter;
            if([tempArray count]>0){
                [tempObjectsForCharacters setValue:tempArray forKey:@"itemForSection"];
            }
            //nouvelle section
            tempArray= [[NSMutableArray alloc]init];
            tempObjectsForCharacters = [[NSMutableDictionary alloc]init];
            [tempObjectsForCharacters setValue:firstLetter forKey:@"headerSection"];
            [newArray addObject:tempObjectsForCharacters];  
            
        }
        [expo setValue:[NSString stringWithFormat:@"%i",i] forKey:@"row"];
        [tempArray addObject:expo]; 
        
        i++;
        
    }
    [tempObjectsForCharacters setValue:tempArray forKey:@"itemForSection"];
    return newArray;
}

- (void)setData:(NSArray*)array orderByKey:(NSString *)key{
    NSLog(@"delegaaaaaat");
}


@end
