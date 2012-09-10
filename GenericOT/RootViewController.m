//
//  RootViewController.m
//  GenericOT
//
//  Created by Ian Cundiff on 8/20/11.
//  Copyright 2011 Rose-Hulman. All rights reserved.
//

#import "RootViewController.h"
#import "NewViewController.h"
#import "MapViewController.h"
#import "RecentViewController.h"

@implementation RootViewController

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
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
    switch (((UIButton*)sender).tag) {
        case 1:
            [self.navigationController pushViewController:[NewViewController alloc] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[RecentViewController alloc] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[MapViewController alloc] animated:YES];
            break;
        default:
            break;
    }
}

@end
