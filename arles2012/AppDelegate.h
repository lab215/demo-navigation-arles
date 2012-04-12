//
//  AppDelegate.h
//  arles2012
//
//  Created by Franco Bouly on 1/7/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIViewController *centerController;
@property (strong, nonatomic) UIViewController *leftController;
@property (strong, nonatomic) UIViewController *imageController;
@end
