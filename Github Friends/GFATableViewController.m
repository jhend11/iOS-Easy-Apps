//
//  GFATableViewController.m
//  Github Friends
//
//  Created by JOSH HENDERSHOT on 7/24/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "GFATableViewController.h"
#import "GFATableViewCell.h"

@interface GFATableViewController () <UITextFieldDelegate>


@end

@implementation GFATableViewController

{
    NSMutableArray * githubFriends;
    
    UITextField * search;
    
    UIButton * find;
    
    
    
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        githubFriends = [@[
                           
        @{
                               
            @"login": @"jhend11",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/7279926?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",

            },
        @{
            
            @"login": @"Anterio",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224728?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",
            
            },
        @{
            
            @"login": @"josephlausf",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/7451830?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",
            
            },
        @{
            
            @"login": @"kalson",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/7114996?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",
            
            },
        @{
            
            @"login": @"jeremycbutler",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/7903562?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",
            
            },
        @{
            
            @"login": @"renecandelier",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/4494771?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",
            
            },
        @{
            
            @"login": @"ericstephen",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224735?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",
            
            },
        @{
            
            @"login": @"schwaebek",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/6909470?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",
            
            },
        @{
            
            @"login": @"ewjseidel",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224720?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",
            
            },
        @{
            
            @"login": @"npeterson213",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224722?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",
            
            },
        @{
            
            @"login": @"dmerrill88",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224723?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",
            
            },
        @{
            
            @"login": @"jaimeconnor",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224727?",
            @"location": @"Atlanta, GA",
            @"followers": @"0",
            @"following":@"0",
            
            },
        
                          
                           
        ] mutableCopy];
        
        
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

    
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    
    self.tableView.tableHeaderView = headerView;
    
    
    
    search = [[UITextField alloc] initWithFrame:CGRectMake(screenWidth + 20, 35,220, 45.0)];
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
    
    [self.view addSubview:search];
    
    
    
    find = [[UIButton alloc]initWithFrame:CGRectMake(screenWidth + 260.0, 30, 50.0, 50)];
    find.backgroundColor = [UIColor lightGrayColor];
    [find setTitle:@"?" forState:UIControlStateNormal];
    [find addTarget:self action:@selector(findButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    find.layer.cornerRadius = 25;
    [self.view addSubview:find];

//    UIButton * buttonPad = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
//    find.rightView = buttonPad;
    
    
    
    
    
    
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];
    
    
    
    
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}




-(void)findButtonWasClicked
{
    NSLog(@"findButton was clicked");
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
    return 90;
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
    cell.backgroundColor = [UIColor colorWithRed:1.000f green:1.000f blue:1.000f alpha:1.0f];
    
    
    
    
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

@end
