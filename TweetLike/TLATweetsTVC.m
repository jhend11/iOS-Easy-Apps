//
//  TLATweetsTVC.m
//  Tweet Like
//
//  Created by JOSH HENDERSHOT on 8/11/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "TLATweetsTVC.h"
#import "TLATweetCell.h"
#import "TLANewTweetVC.h"
#import "AFNetworking.h"
#import "TLAViewTweetController.h"
#import <Parse/Parse.h>

@interface TLATweetsTVC ()<TLATweetCellDelegate>

@end

@implementation TLATweetsTVC
{
    NSMutableArray * tweetLikes;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        
        tweetLikes = [@[]mutableCopy];
        
        // after twitter JSON is requested, query parse where key @"id" is equalto : tweet[@"id"]
        // if query returns no result ... save tweet pfobject based on tweet.
        // if query returns result... do nothing
        //after looping through json objects, query parse for tweet objects and fill tableview with the result
        // when clicking on a heart update the cell, also find the tweet object that matches it's @"id" and update the @"hearts" value
        

        
        AFHTTPRequestOperationManager * requestManager = [[AFHTTPRequestOperationManager alloc]init];
        [requestManager GET:@"http://jo2.co/twitter.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
            
            PFQuery * queryAll = [PFQuery queryWithClassName:@"Tweet"];
            [queryAll findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
             {
                 for (NSDictionary * tweet in responseObject)
                 {
                     BOOL tweetLikeFound = NO;
                     
                     for (PFObject * tweetLike in objects)
                     {
                         if ([(tweet[@"id"]) isEqual:tweetLike[@"id"]])
                         {
                             tweetLikeFound = YES;
                             
                             [tweetLikes addObject:tweetLike];
                         }
                     }
                     if (!tweetLikeFound)
                     {
                         PFObject *newTweetLike = [PFObject objectWithClassName:@"Tweet"];
                         [newTweetLike setObject:tweet[@"id"] forKey:@"id"];
                         [newTweetLike setObject:tweet[@"text"] forKey:@"text"];
                         [newTweetLike setObject:@0 forKey:@"hearts"];
                         [newTweetLike saveInBackground];
                         
                         [tweetLikes addObject:newTweetLike];
                     }
                 }
                 
                 
                 [self.tableView reloadData];
             }];
            
            
            
//            tweets = [responseObject mutableCopy];
//            for (NSDictionary * tweet in responseObject)
//            {
//                
//                
//                PFQuery * query = [PFQuery queryWithClassName:@"Tweet"];
//                [query whereKey:@"id" equalTo:tweet[@"id"]];
//                [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
//                    {
//                    if (objects.count > 0)
//                    {
//                        
//                    } else {
//                        NSLog(@"new tweet added");
//                    }
//                }];
//                
//               
////                
////                [tweets addObject: [@{
////                                      @"id": tweet[@"id"],
////                                      @"text": tweet[@"text"],
////                                      @"hearts":@0
////                                      }mutableCopy]];
//            }
            
            ///done looping through twitter json
            
           

        
        }
            failure:^(AFHTTPRequestOperation *operation, NSError *error)
        {
            
        }];
    
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.separatorColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];
    
    
    UIImageView * logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"header_logo"]];
    [self.navigationController.navigationBar addSubview:logo];
    logo.frame = CGRectMake(0, 0, 121, 24);
    logo.center = self.navigationController.navigationBar.center;
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return tweetLikes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLATweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    PFObject * tweet = tweetLikes[indexPath.row];
    
    cell.heartCountLabel.text = (tweet[@"hearts"]) ? [NSString stringWithFormat:@"%@", tweet[@"hearts"]] : @"0";
        cell.tweetTextView.text = tweet[@"text"];
    cell.tweet = tweet;
    cell.delegate = self;

    
    return cell;
}
-(void)heartsUpdated
{
    [self.tableView reloadData];
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



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showNewTweetVC"])
    {
    TLANewTweetVC * newTweetVC = segue.destinationViewController;
    
    newTweetVC.tweets = tweetLikes;
    }
    else
    {
        NSIndexPath * indexPath = [self.tableView indexPathForCell:sender];
        TLAViewTweetController * viewTweet = segue.destinationViewController;
        viewTweet.tweet = tweetLikes [indexPath.row];
        
        
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(BOOL)prefersStatusBarHidden { return YES;}
@end
