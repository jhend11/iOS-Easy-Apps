//
//  GFATableViewController.m
//  Github Friends
//
//  Created by JOSH HENDERSHOT on 7/24/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "GFATableViewController.h"
#import "GFATableViewCell.h"
#import "GFAViewController.h"
#import "GRAGithubRequest.h"
@interface GFATableViewController () <UITextFieldDelegate, UITableViewDelegate>
//   3e4d1f26315b54680f936f644ae117fac87ae697

@end

@implementation GFATableViewController

{
    NSMutableArray * githubFriends;
    
    UITextField * search;
    
    UIButton * find;
    
    UIButton * profile;

    
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        githubFriends = [@[] mutableCopy];
        
        NSArray * loadedUsers = [GRAGithubRequest loadUsers];
        
        if (loadedUsers)
        {
            githubFriends = [loadedUsers mutableCopy];
        }
        
        self.tableView.rowHeight = 100;
        
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        
        
    }
    return self;
}



-(void)dismissKeyboard
{
    [search resignFirstResponder];
}


- (void)viewDidLoad
{
    
    
    
    int screenWidth = [[UITableViewHeaderFooterView alloc]init].bounds.size.height;

    
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    
    self.tableView.tableHeaderView = headerView;
    
    headerView.backgroundColor = [UIColor colorWithRed:0.937f green:0.125f blue:0.333f alpha:1.0f];
    
    
    
    search = [[UITextField alloc] initWithFrame:CGRectMake(screenWidth + 20, 10,220, 45.0)];
    search.backgroundColor = [UIColor colorWithRed:1.000f green:1.000f blue:1.000f alpha:1.0f];
    search.autocapitalizationType = UITextAutocapitalizationTypeNone;
    search.autocapitalizationType = UITextAutocorrectionTypeNo;
    search.placeholder = @" search";
    search.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    search.leftView= paddingView;
    
    search.leftViewMode = UITextFieldViewModeAlways;
    search.layer.borderColor = [UIColor blackColor].CGColor;
    search.layer.borderWidth = 1;
    
    search.delegate = self;
    
    [headerView addSubview:search];
    
    
    

    
    
    find = [UIButton buttonWithType:UIButtonTypeCustom];
    find.frame = CGRectMake(screenWidth + 260.0, 12, 40.0, 40);
    [find setBackgroundImage:[UIImage imageNamed:@"searchButton.png"] forState:UIControlStateNormal];
    [find addTarget:self action:@selector(findButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:find];
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];
    
    
    
    
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



-(void)findButtonWasClicked
{
    

    
    NSDictionary * userInfo = [GRAGithubRequest requestUserInfo:search.text];
    
    [githubFriends addObject:userInfo];
    
    [githubFriends insertObject:userInfo atIndex:0];
    
    [self.tableView reloadData];

    NSLog(@"findButton was clicked");
    
    [GRAGithubRequest saveUsers:githubFriends];
    
    search.text = @"";
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return 0;
//}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    // Return the number of rows in the section.
    return githubFriends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GFATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
 
    
    if (cell == nil)
    {
        cell = [[GFATableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//        cell.textLabel =[(@"login",githubFriends)];
        
    }
    
    
    cell.friendInfo = githubFriends[indexPath.row];
    cell.navigationController = self.navigationController;
    
    cell.backgroundColor = [UIColor colorWithRed:0.184f green:0.184f blue:0.184f alpha:1.0f];
    
    
    
    
    // Configure the cell...
    
    return cell;
}
-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    
}

//-(void)profileButtonWasClicked
//{
//    
//    UINavigationController* sender = [[UINavigationController alloc]init];
//    
//    
//    sender.view.backgroundColor = [UIColor lightGrayColor];
//    
//    [self.navigationController pushViewController:sender animated:YES];
//    
//}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select row @ %@", indexPath);
    
    GFAViewController * profileView = [[GFAViewController alloc]init];
    
    profileView.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.navigationController pushViewController:profileView animated:1];
    
    profileView.friendInfo = githubFriends[indexPath.row];
    

    
    
}




// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [githubFriends removeObjectAtIndex:indexPath.row];
        [GRAGithubRequest saveUsers:githubFriends];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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
