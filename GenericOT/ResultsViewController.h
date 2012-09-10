//
//  ResultsViewController.h
//  GenericOT
//
//  Created by Ian Cundiff on 8/26/11.
//  Copyright 2011 Rose-Hulman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewViewController.h"
#import "MapViewController.h"

@interface ResultsViewController : UIViewController <UIAlertViewDelegate>

@property(nonatomic, retain) NSNumber *combinedMPG;
@property(nonatomic, retain) NSNumber *distance;
@property(nonatomic, retain) IBOutlet UILabel *mpgLabel;
@property(nonatomic, retain) IBOutlet UILabel *distanceLabel;

-(IBAction)buttonPressed:(id)sender;

-(void)showAlertView;

@end
