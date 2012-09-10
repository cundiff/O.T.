//
//  NewViewController.h
//  GenericOT
//
//  Created by Ian Cundiff on 8/22/11.
//  Copyright 2011 Rose-Hulman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "ResultsViewController.h"
#import "HTMLParser.h"

@interface NewViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, retain) IBOutlet UIWebView *carSelector;

-(IBAction)homeButtonPressed:(id)sender;

@end
