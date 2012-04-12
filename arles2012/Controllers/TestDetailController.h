//
//  TestDetailController.h
//  ViewDeckExample
//
//  Created by Franco Bouly on 1/6/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolBar.h"

@interface TestDetailController : UIViewController <ToolBarDelegate>

@property (nonatomic, strong) ToolBar *toolBar;
@end
