//
//  AgendaPagedViewController.h
//  arles2012
//
//  Created by Franco Bouly on 1/27/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RootViewController.h"
#import "AgendaViewController.h"

@interface AgendaPagedViewController : RootViewController <UIScrollViewDelegate, AgendaCellDelegate>

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
