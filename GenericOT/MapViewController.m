//
//  MapViewController.m
//  GenericOT
//
//  Created by Ian Cundiff on 8/21/11.
//  Copyright 2011 Rose-Hulman. All rights reserved.
//

#import "MapViewController.h"

#define METERS_PER_MILE 1609.34

@implementation MapViewController

@synthesize mapView, circleView, radius, locationManager;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
//    locationManager = [[CLLocationManager alloc] init];
//    [locationManager startUpdatingLocation];
    
    self.mapView.zoomEnabled = YES;
    
    if (self.mapView.region.span.longitudeDelta*69.0 > radius || self.mapView.region.span.latitudeDelta*69.0 > radius) {
    }
    
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(39.481881, -87.324094) radius:radius*METERS_PER_MILE];
    [self.mapView addOverlay:circle];
    
    MKCoordinateRegion region;
    region.center = circle.coordinate;  
    
    //I think it's fine that it starts zoomed in really close
    //because that makes people appreciate how far they can go
    MKCoordinateSpan span; 
    span.latitudeDelta  = .05;
    span.longitudeDelta = .05; 
    region.span = span;
    
    [self.mapView setRegion:region animated:YES];
    
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

- (IBAction)homeButtonPressed:(id)sender {
//    [self.navigationController pushViewController:[RootViewController alloc] animated:NO];
    //TODO make this go back to the view that called it, because it's not really a "home" button
    [self.navigationController removeFromParentViewController];
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id)overlay{
    circleView = nil;
    circleView = [[[MKCircleView alloc] initWithOverlay:overlay] autorelease];
    circleView.strokeColor = [UIColor redColor];
    circleView.lineWidth = 1.0;
    circleView.fillColor = [UIColor colorWithRed:(255 / 255.0) green:(0 / 255.0) blue:(0 / 255.0) alpha: 0.1];
    return circleView;
}

@end
