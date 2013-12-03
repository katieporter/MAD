//
//  MADAnnotation.m
//  location-lab-17
//
//  Created by Katie Porter on 11/21/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADAnnotation.h"

@implementation MADAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)coor
{
    _coordinate = coor;
    _title = @"You are here";
    _subtitle = [NSString stringWithFormat:@"Latitude: %f. Longitude: %f", _coordinate.latitude, _coordinate.longitude];
    return self;
}

- (void)moveAnnotation:(CLLocationCoordinate2D)newCoordinate
{
    [self willChangeValueForKey:@"coordinate"];
    [self willChangeValueForKey:@"subtitle"];
    _coordinate = newCoordinate;
    _subtitle = [[NSString alloc]initWithFormat:@"Latitude:%f. Longitude: %f", _coordinate.latitude, _coordinate.longitude];
    [self didChangeValueForKey:@"coordinate"];
    [self didChangeValueForKey:@"subtitle"];
}

@end
