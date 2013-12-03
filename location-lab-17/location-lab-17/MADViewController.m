//
//  MADViewController.m
//  location-lab-17
//
//  Created by Katie Porter on 11/21/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADViewController.h"
#import "MADAnnotation.h"

@interface MADViewController ()

@end

@implementation MADViewController
{
    CLLocationManager *locationManager;
    MADAnnotation *annotation;
}

- (void)viewDidLoad
{
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    // Specify desired accuracy
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // Specify the distance a device must move (laterally) to generate an update
    locationManager.distanceFilter = kCLDistanceFilterNone;
    // Start the location manager
    [locationManager startUpdatingLocation];
    
    _mapView.delegate = self;
    _mapView.mapType = MKMapTypeHybrid;

    [super viewDidLoad];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    _latitudeLabel.text = [[NSString alloc]initWithFormat:@"%f", manager.location.coordinate.latitude];
    _longitudeLabel.text = [[NSString alloc]initWithFormat:@"%f", manager.location.coordinate.longitude];
    _altitudeLabel.text = [[NSString alloc]initWithFormat:@"%f", manager.location.altitude];
    _accuracyLabel.text = [[NSString alloc]initWithFormat:@"%f", manager.location.horizontalAccuracy];
    
    // Define the area spanned by a map region
    MKCoordinateSpan span;
    // The amount of north-to-south distance (in degrees)
    span.latitudeDelta = .001;
    // The amount of east-to-west distance
    span.longitudeDelta = .001;
    // Region of the map to be displayed
    MKCoordinateRegion region;
    // Set the center of the region to be the newLocation
    region.center = manager.location.coordinate;
    // Set the horizontal and certical span of the map to display
    region.span = span;
    [_mapView setRegion:region animated:YES];
    
    // Display annotation
    if (annotation)
    {
        [annotation moveAnnotation:manager.location.coordinate];
    }
    else
    {
        annotation = [[MADAnnotation alloc] initWithCoordinate:manager.location.coordinate];
        [_mapView addAnnotation:annotation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *errorType;
    if (error.code == kCLErrorDenied)
    {
        errorType = @"Access Denied";
    }
    else
    {
        errorType = @"Error";
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                   message:errorType
                                                  delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
