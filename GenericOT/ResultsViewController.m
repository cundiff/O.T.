//
//  ResultsViewController.m
//  GenericOT
//
//  Created by Ian Cundiff on 8/26/11.
//  Copyright 2011 Rose-Hulman. All rights reserved.
//

#import "ResultsViewController.h"

#define AVERAGE_TANK_SIZE 15

@implementation ResultsViewController

@synthesize combinedMPG, mpgLabel, distanceLabel, distance;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)viewWillAppear:(BOOL)animated {
    [self.mpgLabel setText:[combinedMPG stringValue]];
    if ([distance intValue] != 0) {
        [self.distanceLabel setText:[distance stringValue]];
    } else {
        int approximateDistance = [combinedMPG intValue] * AVERAGE_TANK_SIZE;
        [self.distanceLabel setText:[NSString stringWithFormat:@"%d",approximateDistance]];
        
        distance = [[NSNumber alloc] initWithInt: approximateDistance];
        
        [self showAlertView];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed:(id)sender {
    MapViewController *mapVC = [[MapViewController alloc] init];
    [mapVC setRadius:[distance doubleValue]];
    
    switch (((UIButton*)sender).tag) {
        case 1:
            [self.navigationController pushViewController:[NewViewController alloc] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:mapVC animated:YES];
            break;
        default:
            break;
    }
}

- (void)showAlertView {
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert setTitle:@"Here's the deal..."];
    [alert setMessage:@"The EPA didn't have any data on the size of your gas tank, so I've taken the liberty of assuming an average size of 15 gallons."];
    [alert setDelegate:self];
    [alert addButtonWithTitle:@"Okay"];
    [alert show];
    [alert release];
}

@end
