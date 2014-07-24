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
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        friendName = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, 200, 40)];
        
        [self.contentView addSubview:friendName];
        
        friendImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        [self.contentView addSubview:friendImage];
        
        
        
        
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
    
    
    
    
    
    NSLog(@"%@", friendInfo);
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
