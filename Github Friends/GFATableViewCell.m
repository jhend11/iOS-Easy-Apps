//
//  GFATableViewCell.m
//  Github Friends
//
//  Created by JOSH HENDERSHOT on 7/24/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "GFATableViewCell.h"
#import "GRAGithubRequest.h"
#import "GFAViewController.h"
#import "GFAViewController2222222.h"
@interface UITableViewController () <UIPageViewControllerDelegate>
@end

@implementation GFATableViewCell
{
    NSMutableArray * githubFriends;

    UILabel * friendName;
    
    UIImageView * friendImage;
    
    UILabel * friendLoc;
    UILabel * followers;
    UILabel * following;
    UILabel * gist2;
    UILabel * up;
    UILabel * down;
    UILabel * blank;
    UILabel * leader;
    UILabel * follower;
    UILabel * justFriends;
    
    UIButton * gist;
    UIButton * btn;
    UIButton * btn1;
    
    UIButton * profile;
    
    UIImage * downArrow;
    
    
    UIWebView * webView;
    
    
    
}




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        
        
        self.layer.borderWidth = 0.25;
        self.layer.borderColor = [[UIColor blackColor]CGColor];
        
        

        
        
        friendLoc =[[UILabel alloc] initWithFrame:CGRectMake(120, 40, 200, 40)];
        [self.contentView addSubview:friendLoc];
        friendLoc.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:15];
        
        
        
        
        
        friendName = [[UILabel alloc]initWithFrame:CGRectMake(100, 5, 200, 40)];
        [self.contentView addSubview:friendName];
        friendName.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:15];
        friendName.textColor = [UIColor whiteColor];

        
        friendLoc = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, 200, 40)];
        [self.contentView addSubview:friendLoc];
        friendLoc.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:15];
        friendLoc.textColor = [UIColor whiteColor];

    

        
        friendImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
        [self.contentView addSubview:friendImage];

        
        
        gist = [[UIButton alloc]initWithFrame:CGRectMake(250.0, 50, 60.0, 25)];
        [gist setTitle:@"GISTS" forState:UIControlStateNormal];
        gist.backgroundColor = [UIColor colorWithRed:0.184f green:0.184f blue:0.184f alpha:1.0f];
        [gist addTarget:self action:@selector(gistButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
        gist.layer.cornerRadius = 12;
        gist.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:15];
        gist.layer.borderWidth = 0.5;
        gist.layer.borderColor = [[UIColor whiteColor]CGColor];
        [self.contentView addSubview:gist];
        
        gist2 = [[UILabel alloc]initWithFrame:CGRectMake(230.0, 50, 25.0, 25)];
        gist2.layer.cornerRadius = 12;
        gist2.layer.masksToBounds= 1;
        gist2.backgroundColor = [UIColor whiteColor];
        gist2.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:15];
        gist2.textAlignment= NSTextAlignmentCenter;
        [self.contentView addSubview:gist2];

        
        
        
        
        profile = [UIButton buttonWithType:UIButtonTypeCustom];
        profile.frame = CGRectMake(260.0, 10, 30, 30);
        [profile setBackgroundImage:[UIImage imageNamed:@"profileArrow.png"] forState:UIControlStateNormal];
        [profile addTarget:self action:@selector(profileButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:profile];
    

        
        
        
    }
    return self;
}




-(void)profileButtonWasClicked
{
    
    GFAViewController* sender = [[GFAViewController alloc]init];
    
    
    sender.view.backgroundColor = [UIColor lightGrayColor];
    
    sender.friendInfo = self.friendInfo;
    
    
    
    [self.navigationController pushViewController:sender animated:YES];
    

    NSLog(@"profileButton was clicked");
}



//  @"login": @"jhend11",
//  @"id": @7279926,
//  @"avatar_url": @"https://avatars.githubusercontent.com/u/7279926?",





-(void)setFriendInfo:(NSDictionary *)friendInfo
{
    _friendInfo = friendInfo;
    
    NSURL * url = [NSURL URLWithString:friendInfo[@"avatar_url"]];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * image = [UIImage imageWithData:data];
    
    
    NSURL * url2 = [NSURL URLWithString:self.friendInfo[@"html_url"]];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url2];
    [webView loadRequest:request];
    
    friendName.text = friendInfo[@"name"];
    friendImage.image = image;
    
    NSNumber * num = _friendInfo[@"public_gists"];
    NSString *numStr = [NSString stringWithFormat:@"%@",num];
    gist2.text = numStr;

    friendLoc.text = friendInfo[@"loaction"];
    
     // coonvert nsnumber to nsstring
    
    int a = [friendInfo[@"followers"] intValue] - [friendInfo[@"following"] intValue];
//    int b = [friendInfo[@"following"] intValue] - [friendInfo[@"followers"] intValue];

    if (a > 0)
    {
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(100, 65, 20, 20);
        [btn setBackgroundImage:[UIImage imageNamed:@"upArrow.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:btn];

        down= [[UILabel alloc]initWithFrame:CGRectMake(118.0, 65, 20.0, 20)];
        down.layer.cornerRadius = 10;
        down.layer.masksToBounds= 1;
        down.backgroundColor = [UIColor colorWithRed:0.184f green:0.184f blue:0.184f alpha:1.0f];
        down.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:10];
        down.textColor = [UIColor whiteColor];
        down.textAlignment= NSTextAlignmentCenter;
        down.layer.borderWidth = 0.5;
        down.layer.borderColor = [[UIColor whiteColor]CGColor];
        down.text = [NSString stringWithFormat:@"%d", abs(a)];
        [self.contentView addSubview:down];
        
        leader= [[UILabel alloc]initWithFrame:CGRectMake(148.0, 65, 40.0, 20)];
        leader.backgroundColor = [UIColor colorWithRed:0.184f green:0.184f blue:0.184f alpha:1.0f];
        leader.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:10];
        leader.text = @"Leader";
        leader.textColor = [UIColor colorWithRed:0.196f green:0.973f blue:0.749f alpha:1.0f];
        leader.textAlignment= NSTextAlignmentCenter;
        [self.contentView addSubview:leader];
        


    }

    else if (a < 0)
    {
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(100, 65, 20, 20);
    [btn1 setBackgroundImage:[UIImage imageNamed:@"downArrow.png"] forState:UIControlStateNormal];
    [self.contentView addSubview:btn1];

        down= [[UILabel alloc]initWithFrame:CGRectMake(118.0, 65, 20.0, 20)];
        down.layer.cornerRadius = 10;
        down.layer.masksToBounds= 1;
        down.backgroundColor = [UIColor colorWithRed:0.184f green:0.184f blue:0.184f alpha:1.0f];
        down.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:10];
        down.textAlignment= NSTextAlignmentCenter;
        down.layer.borderWidth = 0.5;
        down.layer.borderColor = [[UIColor whiteColor]CGColor];
        down.textColor = [UIColor whiteColor];
        down.text = [NSString stringWithFormat:@"%d", abs(a)];

        [self.contentView addSubview:down];
        
        follower= [[UILabel alloc]initWithFrame:CGRectMake(148.0, 65, 40.0, 20)];
        follower.backgroundColor = [UIColor colorWithRed:0.184f green:0.184f blue:0.184f alpha:1.0f];
        follower.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:10];
        follower.text = @"Follower";
        follower.textColor = [UIColor redColor];
        follower.textAlignment= NSTextAlignmentCenter;
        [self.contentView addSubview:follower];

        
    }
    else
    {
        
        
        btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame = CGRectMake(100, 65, 20, 20);
        btn1.layer.cornerRadius = 10;
        btn1.layer.masksToBounds = YES;
        btn1.backgroundColor = [UIColor colorWithRed:0.498f green:0.498f blue:0.498f alpha:1.0f];
        [self.contentView addSubview:btn1];
        
        down= [[UILabel alloc]initWithFrame:CGRectMake(118.0, 65, 20.0, 20)];
        down.layer.cornerRadius = 10;
        down.layer.masksToBounds= 1;
        down.backgroundColor = [UIColor colorWithRed:0.184f green:0.184f blue:0.184f alpha:1.0f];
        down.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:10];
        down.textAlignment= NSTextAlignmentCenter;
        down.layer.borderWidth = 0.5;
        down.layer.borderColor = [[UIColor whiteColor]CGColor];
        down.textColor = [UIColor whiteColor];
        down.text = [NSString stringWithFormat:@"%d", a];

        [self.contentView addSubview:down];
        
        justFriends= [[UILabel alloc]initWithFrame:CGRectMake(148.0, 65, 60.0, 20)];
        justFriends.backgroundColor = [UIColor colorWithRed:0.184f green:0.184f blue:0.184f alpha:1.0f];
        justFriends.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:10];
        justFriends.text = @"Just Friends";
        justFriends.textColor = [UIColor colorWithRed:0.498f green:0.498f blue:0.498f alpha:1.0f];
        justFriends.textAlignment= NSTextAlignmentCenter;
        [self.contentView addSubview:justFriends];
        
    }

    
    
    
    
    
    
    NSLog(@"%@", friendInfo);
}




-(void)gistButtonWasClicked
{
    GFAViewController2222222* sender1 = [[GFAViewController2222222 alloc]init];
    
    
    sender1.view.backgroundColor = [UIColor lightGrayColor];
    
    sender1.friendInfo = self.friendInfo;
    
    
    
    [self.navigationController pushViewController:sender1 animated:YES];
    
    
    NSLog(@"gist was clicked");
    
    
    
    
//    GFAViewController * profileView = [[GFAViewController alloc]init];
//    
//    profileView.view.backgroundColor = [UIColor lightGrayColor];
//    
//    NSString * gistURL = [NSString stringWithFormat:@"https://gist.github.com/%@", self.friendInfo[@"login"]];
//    profileView.friendInfo = @{@"html_url":gistURL};
//    [self.navigationController pushViewController:profileView animated:YES];
    

}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
