//
//  ViewController.m
//  Rails App OBJC
//
//  Created by JOSH HENDERSHOT on 9/2/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "ViewController.h"
#import "CoreData/CoreData.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *contentField;

@end

@implementation ViewController
{
    NSString * API;
    NSEntityDescription *entity;
    AppDelegate * appD;

}
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    API = @"http://ancient-taiga-9634.herokuapp.com/";
    appD =[[UIApplication sharedApplication]delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:@"Post" inManagedObjectContext: appD.managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"user = 'jo@theironyard'"];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"posted_at"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [appD.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    NSLog(@"%@",fetchedObjects);
    

    
}

- (IBAction)postNew:(id)sender {
    NSString * newPostURL = [NSString stringWithFormat:@"http://ancient-taiga-9634.herokuapp.com/posts?post[title]=%@&post[content]=%@", self.titleField.text, self.contentField.text];
    
    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:newPostURL]];
    request.HTTPMethod = @"POST";
    [request setValue:@"zxcasdqwe" forHTTPHeaderField:@"AUTH_TOKEN"];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSArray * posts = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@", posts);
    }];
    
//    [entity setValue:self.titleField.text forKey:@"title"];
    [appD saveContext];
    

}

- (IBAction)getMyPosts:(id)sender {
    
    NSString * string = [NSString stringWithFormat:@"http://ancient-taiga-9634.herokuapp.com/posts/mine"];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:string]];
    [request setValue:@"zxcasdqwe" forHTTPHeaderField:@"AUTH_TOKEN"];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSArray * posts = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@", posts);
    }];
}

- (IBAction)getAllPosts:(id)sender {
    NSString * string = [NSString stringWithFormat:@"http://ancient-taiga-9634.herokuapp.com/posts"];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:string]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSArray * posts = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@", posts);
    }];
}
@end
