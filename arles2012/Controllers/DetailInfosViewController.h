//
//  DetailInfosViewController.h
//  arles2012
//
//  Created by SEVERINE LOUVIERS on 27/01/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailInfosViewController : UIViewController{
    NSURLRequest *requestObject;
}
@property (weak, nonatomic) IBOutlet UIWebView *contentWebView;


-(void)configureViewWithUrl:(UIImage*)urlString;
@end
