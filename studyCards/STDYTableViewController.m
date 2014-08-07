//
//  STDYTableViewController.m
//  studyCards
//
//  Created by JOSH HENDERSHOT on 8/2/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "STDYTableViewController.h"
#import "STDYTableViewCell.h"

@interface STDYTableViewController ()

@end

@implementation STDYTableViewController
{
    NSArray * chapters;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        

//        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
        chapters = @[@"Chapter 1", @"Chapter 2", @"Chapter 3", @"Chapter 4", @"Chapter 5", @"Chapter 6",
                     @"Chapter 7", @"Chapter 8", @"Chaper 9"];

//        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    UILabel * headerView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    
    headerView.backgroundColor = [UIColor colorWithRed:0.220f green:0.251f blue:0.278f alpha:1.0f];
    headerView.text = @"Select Chapters";
    headerView.textColor = [UIColor colorWithRed:0.388f green:0.808f blue:0.514f alpha:1.0f];
    headerView.textAlignment = NSTextAlignmentCenter;
    headerView.font = [UIFont fontWithName:@"Copperplate-Bold" size:30];
    [self.view addSubview:headerView];

    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    return chapters.count;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    // Return the number of rows in the section.
//    return chapters.count;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STDYTableViewCell *cell = [[STDYTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
//    cell.textLabel.text = chapters[0];
    cell.backgroundColor = [UIColor lightGrayColor];

//    cell.textLabel = chapters[index.row];

    // Configure the cell...
    
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
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
