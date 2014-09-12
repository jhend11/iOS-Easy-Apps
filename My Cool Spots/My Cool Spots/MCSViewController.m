//
//  MCSViewController.m
//  My Cool Spots
//
//  Created by JOSH HENDERSHOT on 8/18/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "MCSViewController.h"
#import "MapKit/MapKit.h"
#import <CoreLocation/CoreLocation.h>
#import "MCSAnnotation.h"
#import "MCSTableViewController.h"

@interface MCSViewController ()<CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation MCSViewController
{
    MKMapView * myMapView;
    CLLocationManager * locationManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myMapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 360)];
//    myMapView.layer.borderColor = [[UIColor blueColor]CGColor];
    [self.view addSubview:myMapView];
    myMapView.showsUserLocation = YES;
    myMapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    CLLocation * loc = [[CLLocation alloc]init];
    NSLog(@"%f", loc.coordinate.latitude);
    locationManager.location.coordinate.latitude
    
    MCSTableViewController * tVC = [[MCSTableViewController alloc]init];
    tVC.tableView.frame = CGRectMake(0, 300, 320, 200);
    [self.view addSubview:tVC.tableView];
    
    [self addChildViewController:tVC];
    
    UIImageView * logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4^2"]];
    [self.navigationController.navigationBar addSubview:logo];
    logo.frame = CGRectMake(0, 0, 40, 40);
    logo.center = self.navigationController.navigationBar.center;
    
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    for (CLLocation * location in locations) {
        NSLog(@"%f %f",location.coordinate.latitude, location.coordinate.longitude);
        
        // call foursquarerequest and create annotations for each venue
        
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
        [myMapView setRegion:region animated:YES];
        for (int i = 0; i < 10; i++)
        {
        MCSAnnotation * annotation = [[MCSAnnotation alloc]init];
            float randomLat = arc4random_uniform((100) - 50.0) / 100.0 + location.coordinate.latitude;
            float randomLong = arc4random_uniform((100) - 50.0)/ 100.0 + location.coordinate.longitude;
        [annotation setCoordinate:CLLocationCoordinate2DMake(randomLat, randomLong)];
        [myMapView addAnnotation:annotation];
            
            CLLocationCoordinate2D randomCoordinate = CLLocationCoordinate2DMake(randomLat, randomLong);
            
            [annotation setCoordinate:randomCoordinate];
            
            CLGeocoder * geocoder = [[CLGeocoder alloc]init];
            
            CLLocation * randomLocation = [[CLLocation alloc]initWithLatitude:randomCoordinate.latitude longitude:randomCoordinate.longitude];
            
            [geocoder reverseGeocodeLocation:randomLocation completionHandler:^(NSArray *placemarks, NSError *error)
            {
                for (CLPlacemark * placemark in placemarks)
                {
                    [annotation setTitle:placemark.addressDictionary[@"City"]];
                }
            }];
        }
        
        
    }
    
    myMapView.showsUserLocation = YES;

    [locationManager stopUpdatingLocation];
}
-(void)showDetailVC
                                      {
                                          UIViewController * detailVC = [[UIViewController alloc]init];
                                          detailVC.view.backgroundColor = [UIColor whiteColor];
                                          [self.navigationController pushViewController:detailVC animated:YES];
                                      }
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MCSAnnotation * ann = annotation;
    if (mapView.userLocation.location.coordinate.latitude == ann.coordinate.latitude && mapView.userLocation.location.coordinate.longitude == ann.coordinate.longitude)
    {
    }
    else{
    
    MKPinAnnotationView * annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
    annotationView.draggable = YES;
        
        NSArray * markers = @[
                              [UIImage imageNamed:@"red"],
                              [UIImage imageNamed:@"blue"],
                              [UIImage imageNamed:@"green"],
                              ];
        int randomMarker = arc4random_uniform((int)markers.count);

        annotationView.image = markers[randomMarker];
        annotationView.canShowCallout = YES;
        
        UIButton *rightCallout = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
                                  
        [rightCallout addTarget:self action:@selector(showDetailVC) forControlEvents:UIControlEventTouchUpInside];
                                  
        annotationView.rightCalloutAccessoryView = rightCallout;
        
    return annotationView;
    }
    return nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
