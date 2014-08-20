//
//  MSAFirstViewController.m
//  Mayorships
//
//  Created by JOSH HENDERSHOT on 8/19/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "MSAFirstViewController.h"
#import "MSARequest.h"
#import <CoreLocation/CoreLocation.h>
#import "MSAData.h"
@interface MSAFirstViewController ()<UITableViewDataSource, UITableViewDelegate,CLLocationManagerDelegate>

@end

@implementation MSAFirstViewController
{
    NSArray * mayorships;
    CLLocationManager * locationManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    self.mayorList.dataSource = self;
    self.mayorList.delegate = self;
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * location = locations[0];
    [locationManager stopUpdatingLocation];
    [MSARequest findMayorshipsWithLocation:location completion:^(NSArray * mayors)
    {
        mayorships = mayors;
        [self.mayorList reloadData];
        
    }];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mayorships.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self.mayorList dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary * mayor = mayorships[indexPath.row];
    cell.textLabel.text = mayor[@"user"][@"firstName"];
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@100x100%@",mayor[@"user"][@"photo"][@"prefix"], mayor[@"user"][@"photo"][@"suffix"]]];
    
    NSString * documentDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString * filePath = [documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", mayor[@"user"][@"id"]]];
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    
    if (!fileExists)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
            NSData * data = [NSData dataWithContentsOfURL:url];
            
            NSLog(@"file request : %@", url);
            
            [data writeToFile:filePath atomically:YES];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                cell.imageView.image = [UIImage imageWithData:data];
                
            });
            
        });
    } else {
        cell.imageView.image = [UIImage imageWithContentsOfFile:filePath];
    }
    
    
    
  
    
    
    
//    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
//    button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithData:data]];
//    [cell addSubview:button];
    

    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
