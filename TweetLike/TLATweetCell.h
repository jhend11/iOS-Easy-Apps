//
//  TLATweetCell.h
//  Tweet Like
//
//  Created by JOSH HENDERSHOT on 8/11/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PFObject;
@protocol TLATweetCellDelegate;
@interface TLATweetCell : UITableViewCell
@property (nonatomic) PFObject * tweet;
@property (weak, nonatomic) IBOutlet UILabel *heartCountLabel;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UIButton *heartButton;

@property (nonatomic, assign) id <TLATweetCellDelegate> delegate;
@end

@protocol TLATweetCellDelegate <NSObject>

-(void)heartsUpdated;

@end