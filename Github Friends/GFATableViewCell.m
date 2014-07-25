//
//  GFATableViewCell.m
//  Github Friends
//
//  Created by JOSH HENDERSHOT on 7/24/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "GFATableViewCell.h"

@implementation GFATableViewCell
{
    UILabel * friendName;
    
    UIImageView * friendImage;
    
    UILabel * friendLoc;
    UILabel * followers;
    UILabel * following;
    
    
    UIButton * gist;
    UIButton * btn;
    
    UIImage * downArrow;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        self.layer.borderWidth = 0.25;
        self.layer.borderColor = [[UIColor blackColor]CGColor];
        
        
//        cell.textLabel.text = githubFriends[indexPath.row][@"followers"];
//        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:15];
//        cell.textLabel.

        followers = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 100, 20)];
        [self.contentView addSubview:followers];
        followers.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:10];
        
        following = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 100, 20)];
        [self.contentView addSubview:following];
        following.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:10];
        
        
        friendLoc =[[UILabel alloc] initWithFrame:CGRectMake(120, 40, 200, 40)];
        [self.contentView addSubview:friendLoc];
        friendLoc.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:15];
        
        
        
        
        
        friendName = [[UILabel alloc]initWithFrame:CGRectMake(90, 10, 200, 40)];
        [self.contentView addSubview:friendName];
        friendName.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:15];

        
        friendLoc = [[UILabel alloc]initWithFrame:CGRectMake(90, 40, 200, 40)];
        [self.contentView addSubview:friendLoc];
        friendLoc.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:15];

        
        friendImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        [self.contentView addSubview:friendImage];
        friendImage.layer.cornerRadius = 20;
        friendImage.layer.masksToBounds = 1;
        
        
        gist = [[UIButton alloc]initWithFrame:CGRectMake(220.0, 50, 60.0, 25)];
        [gist setTitle:@"GISTS" forState:UIControlStateNormal];
        gist.backgroundColor = [UIColor colorWithRed:0.184f green:0.184f blue:0.184f alpha:1.0f];
        [gist addTarget:self action:@selector(gistButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
        gist.layer.cornerRadius = 12;
        gist.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:15];
        gist.layer.borderWidth = 0.25;
        gist.layer.borderColor = [[UIColor whiteColor]CGColor];

        [self.contentView addSubview:gist];
        
//        NSData * data2 = [NSData dataWithContentsOfFile:/Users/midniteslide/Downloads/githubFriends];
//        UIImage * image2 = [UIImage imageWithData:data2];
        
        
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(200, 0, 20, 20);
        [btn setBackgroundImage:[UIImage imageNamed:@"downArrow.png"] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(btnSendComment_pressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        
    
        
//        profile = [[UIButton alloc]imageView:CGRectMake(220.0, 10, 30.0, 30)];
//        [profile setBackgroundImage:btn forState:UIControlStateNormal];
//        [profile setTitle:@">" forState:UIControlStateNormal];
//        profile.backgroundColor = [UIColor colorWithRed:0.769f green:0.769f blue:0.769f alpha:1.0f];
//        [profile addTarget:self action:@selector(profileButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
//        profile.layer.cornerRadius = 15;
//        profile.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light"size:15];
        
        
      


//        [self.contentView addSubview:profile];
        
        
        
    }
    return self;
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
    
    
    
    
    friendName.text = friendInfo[@"login"];
    friendImage.image = image;
    
    friendLoc.text = friendInfo[@"location"];

    
    
    
    NSString * followerString = [NSString stringWithFormat:@"Followers : %@", friendInfo[@"followers"]];
    followers.text = followerString;
    
    NSString * followingString = [NSString stringWithFormat:@"Following : %@", friendInfo[@"following"]];
    following.text = followingString;
    
    
    
    
    
    
    NSLog(@"%@", friendInfo);
}


-(void)profileButtonWasClicked
{
    NSLog(@"profileButton was clicked");
}
-(void)gistButtonWasClicked
{
    NSLog(@"gistButton was clicked");
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
