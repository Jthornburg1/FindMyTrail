//
//  TrailCell.m
//  FindMyTrail
//
//  Created by jonathan thornburg on 9/12/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import "TrailCell.h"
#import <AddressBook/AddressBook.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@implementation TrailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showCurrentLocationAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Launch Maps App"
                                                    message:@"Allow FindMyTrail to access your current location?"
                                                   delegate:self
                                          cancelButtonTitle:@"No"
                                          otherButtonTitles:@"Yes", nil];
    [alert show];
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self directToTrail:self.trail];
    }
}

- (IBAction)mapButtonTapped:(id)sender {
    [self showCurrentLocationAlert];
}

- (void)directToTrail:(Trail *)trail
{
    
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = (CLLocationDegrees)[trail.latitude doubleValue];
    coordinate.longitude = (CLLocationDegrees)[trail.longitude doubleValue];
    
    
    MKPlacemark *endLocation = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    MKMapItem *endingItem = [[MKMapItem alloc] initWithPlacemark:endLocation];
    NSMutableDictionary *launchOptions = [NSMutableDictionary new];
    [launchOptions setObject:MKLaunchOptionsDirectionsModeDriving forKey:MKLaunchOptionsDirectionsModeKey];
    [endingItem openInMapsWithLaunchOptions:launchOptions];
}

@end
