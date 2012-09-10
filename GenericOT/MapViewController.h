//
//  MapViewController.h
//  GenericOT
//
//  Created by Ian Cundiff on 8/21/11.
//  Copyright 2011 Rose-Hulman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "RootViewController.h"
#import "CoreLocation/CoreLocation.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) MKCircleView *circleView;
//@property (nonatomic, retain) MKCircle *circle;
@property (nonatomic) CLLocationDistance radius;
@property (nonatomic, retain) CLLocationManager *locationManager;

-(IBAction)homeButtonPressed:(id)sender;

@end
