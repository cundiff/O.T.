//
//  GenericOTAppDelegate.h
//  GenericOT
//
//  Created by Ian Cundiff on 8/20/11.
//  Copyright 2011 Rose-Hulman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
