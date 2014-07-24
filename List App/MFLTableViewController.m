//
//  MFLTableViewController.m
//  List App
//
//  Created by JOSH HENDERSHOT on 7/23/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "MFLTableViewController.h"

@interface MFLTableViewController ()

@property (nonatomic) NSArray * listItems;

@property (nonatomic) NSArray * numbers;


@property (nonatomic) NSArray * info;

@property (nonatomic) NSArray * names;


@end

@implementation MFLTableViewController

{
    UITextField * field1;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        
        
//        self.listItems = @[
//                           @"Monday",
//                           @"Tuesday",
//                           @"Wednesday",
//                           @"Thursday",
//                           @"Friday",
//                           @"Saturday",
//                           @"Sunday"
//                           ];
//        
//        self.numbers = @[@12,@20,@10];
        
        
        
        self.info = @[
                      @{
                          @"day":@"Monday",
                          @"number":@20,
                          @"name":@"John",
                          @"color":[UIColor redColor]
                          },
                      @{
                          @"day":@"Tuesday",
                          @"number":@25,
                          @"name":@"Matt",
                          @"color":[UIColor blueColor]
                          },
                      @{
                          @"day":@"Wednesday",
                          @"number":@30,
                          @"name":@"Josh",
                          @"color":[UIColor purpleColor]
                          },
                      @{
                          @"day":@"Thursday",
                          @"number":@35,
                          @"name":@"Eric",
                          @"color":[UIColor lightGrayColor]
                          },
                      @{
                          @"day":@"Friday",
                          @"number":@40,
                          @"name":@"Steve",
                          @"color":[UIColor orangeColor]
                          },
                      @{
                          @"day":@"Saturday",
                          @"number":@35,
                          @"name":@"Renee",
                          @"color":[UIColor whiteColor]
                          },
                      @{
                          @"day":@"Sunday",
                          @"number":@30,
                          @"name":@"Arthur",
                          @"color":[UIColor magentaColor]
                          },
                      @{                            //Seven
                          @"day":@"Monday",
                          @"number":@20,
                          @"name":@"John",
                          @"color":[UIColor redColor]
                          },
                      @{
                          @"day":@"Tuesday",
                          @"number":@25,
                          @"name":@"Matt",
                          @"color":[UIColor blueColor]
                          },
                      @{
                          @"day":@"Wednesday",
                          @"number":@30,
                          @"name":@"Josh",
                          @"color":[UIColor purpleColor]
                          },
                      @{
                          @"day":@"Thursday",
                          @"number":@35,
                          @"name":@"Eric",
                          @"color":[UIColor lightGrayColor]
                          },
                      @{
                          @"day":@"Friday",
                          @"number":@40,
                          @"name":@"Steve",
                          @"color":[UIColor orangeColor]
                          },
                      @{
                          @"day":@"Saturday",
                          @"number":@35,
                          @"name":@"Renee",
                          @"color":[UIColor whiteColor]
                          },
                      @{
                          @"day":@"Sunday",
                          @"number":@30,
                          @"name":@"Arthur",
                          @"color":[UIColor magentaColor]
                          },
                      @{                        // Fourteen
                          @"day":@"Monday",
                          @"number":@20,
                          @"name":@"John",
                          @"color":[UIColor redColor]
                          },
                      @{
                          @"day":@"Tuesday",
                          @"number":@25,
                          @"name":@"Matt",
                          @"color":[UIColor blueColor]
                          },
                      @{
                          @"day":@"Wednesday",
                          @"number":@30,
                          @"name":@"Josh",
                          @"color":[UIColor purpleColor]
                          },
                      @{
                          @"day":@"Thursday",
                          @"number":@35,
                          @"name":@"Eric",
                          @"color":[UIColor lightGrayColor]
                          },
                      @{
                          @"day":@"Friday",
                          @"number":@40,
                          @"name":@"Steve",
                          @"color":[UIColor orangeColor]
                          },
                      @{
                          @"day":@"Saturday",
                          @"number":@35,
                          @"name":@"Renee",
                          @"color":[UIColor whiteColor]
                          },
                      @{
                          @"day":@"Sunday",
                          @"number":@30,
                          @"name":@"Arthur",
                          @"color":[UIColor magentaColor]
                          },
                      @{                        // Twenty-one
                          @"day":@"Monday",
                          @"number":@20,
                          @"name":@"John",
                          @"color":[UIColor redColor]
                          },
                      @{
                          @"day":@"Tuesday",
                          @"number":@25,
                          @"name":@"Matt",
                          @"color":[UIColor blueColor]
                          },
                      @{
                          @"day":@"Wednesday",
                          @"number":@30,
                          @"name":@"Josh",
                          @"color":[UIColor purpleColor]
                          },
                      @{
                          @"day":@"Thursday",
                          @"number":@35,
                          @"name":@"Eric",
                          @"color":[UIColor lightGrayColor]
                          },
                      @{
                          @"day":@"Friday",
                          @"number":@40,
                          @"name":@"Steve",
                          @"color":[UIColor orangeColor]
                          },
                      @{
                          @"day":@"Saturday",
                          @"number":@35,
                          @"name":@"Renee",
                          @"color":[UIColor whiteColor]
                          },
                      @{
                          @"day":@"Sunday",
                          @"number":@30,
                          @"name":@"Arthur",
                          @"color":[UIColor magentaColor]
                          },

                      ];
        
        
        
    }
    return self;
}











- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}










- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source








- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    
    
    return self.info.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    //    NSString * listItems = [self.listItems objectAtIndex:indexPath.row] ;
    
   //    NSString* listItems = self.listItems[indexPath.row];
   
    

    
//    UIView * box = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
//    box.backgroundColor = [UIColor blueColor];
    
    
    
    NSLog(@"%@",indexPath);
   
    cell.textLabel.text = self.info[indexPath.row][@"day"];
    
    NSNumber * number = self.info[indexPath.row][@"number"];
    
    cell.textLabel.font = [UIFont systemFontOfSize:[number floatValue]];
    
    cell.backgroundColor = self.info[indexPath.row][@"color"];
    
    cell.detailTextLabel.text = self.info[indexPath.row][@"name"];
    
//    cell.accessoryView = self.info[indexPath.row][@"name"];
    
//    field1 = [[UITextField alloc ]initWithFrame:(CGRectMake(10, 10, 10, 10))];
    
//    [cell.contentView addSubview:self.info[indexPath.row][@"name"]];

    
   

  
    
    
    
    
    // Configure the cell..
    
    return cell;
    
    
}









/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end